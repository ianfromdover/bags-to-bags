/// @description aItem, an abstract item
// add unique item properties using the Room Start event instead.

// -----------------------
// ----- attributes  -----
// -----------------------
isStealable = false; // implement chk to collide with personal bag

occupiedSquares = []; // populated during Room Start
size = 0; // no of occ squares, filled during Room Start by Init
boundingLenX = 0;
boundingLenY = 0;

// ---------------------
// ----- temp vars -----
// ---------------------

prevPxPosOfOrigin = noone; // type: Vector2
nearestSlot = noone; // type: oSlot, slot that is nearest to the 'center' of the piece. this slot is the anchor of reference on the item when it is on the grid.
allAvail = false;
isBeingDragged = false;
cursorOffsetX = 0;
cursorOffsetY = 0;

// -------------------
// ----- methods -----
// -------------------

function Init() // (blX, blY)
{
    size = array_length(occupiedSquares);
    boundingLenX = 0; // blX;
    boundingLenY = 0; // blY;
}

function ForeachSlot(baseSlot, fn) // the function is of the form
{                                  // int fn(oSlotGrid parentGrid, Vector2 curr_coords)
    var _size = size;
    var _occupiedSquares = occupiedSquares;
    with (baseSlot)
    {
        /**
         * optimisation (to implement next time)
         * isContinue = fn(parentGrid, curr_coords);
         *
         * Fns must return 0 at the end to loop normally.
         * To use Continue keyword, "return 1;" in the fn.
         * To use Break keyword, "return 2;" in the fn.
         */
        var shouldBreak = undefined;
        for (var i = 0; i < _size; i++)
        {
            if (shouldBreak != undefined) break;

            var curr_coords = coords.sum(_occupiedSquares[i]);
            shouldBreak = fn(parentGrid, curr_coords);
        }
    }
}

// Drag Start (touchscreen) || Mouse Left Pressed (mouse)
function OnDragStart(cursor_x, cursor_y)
{
    UndockSlots();
    isBeingDragged = true;

    // save cursor offset
    cursorOffsetX = x - cursor_x;
    cursorOffsetY = y - cursor_y;
}

function UndockSlots() // with Trunk
{
    if (nearestSlot == noone) return; // piece is not docked

    ForeachSlot(nearestSlot, Undock);

    var item = id;
    with (nearestSlot)
    {
        parentGrid.TakeOutItem(item);
    }
}

function Undock(parentGrid, curr_coords)
{
    if (parentGrid.CoordIsOutsideGrid(curr_coords)) return;

    parentGrid.UndockSlot(curr_coords);
}

function Follow(cursor_x, cursor_y)
{
    if (!isBeingDragged) return; // this line is triggered in Step event

    x = cursor_x + cursorOffsetX;
    y = cursor_y + cursorOffsetY;
    HoverCheck(); // ask the slot to change col depending on availabilit
}

// chks if piece's placement on grid will be free
function HoverCheck()
{
    // 1. determine nearest slot to center of hovering piece
    var nearestList = ds_list_create();
    allAvail = true;

    instance_place_list(x, y, oSlot, nearestList, true);
    nearestSlot = nearestList[| 0];

    // list is no longer needed
    ds_list_destroy(nearestList);

    // if the piece is not on a grid
    if (is_undefined(nearestSlot))
    {
        // for ending drag
        allAvail = false;
        nearestSlot = noone;
        return;
    }

    // 2. check each anticipated slot if is free
    ForeachSlot(nearestSlot, FitSegments);

    // 3. if one is not free, make all the slots an invalid colour
    ForeachSlot(nearestSlot, SetSlotCol);
}

function FitSegments(parentGrid, curr_coords)
{
    if (!parentGrid.CoordIsAvail(curr_coords))
    {
        allAvail = false;
        return "break"; // breaks the loop
    }
}

function SetSlotCol(parentGrid, curr_coords)
{
    if (!parentGrid.CoordIsAvail(curr_coords)) return;

    if (allAvail)
    {
        parentGrid.SetCoordColAvail(curr_coords);
    }
    else
    {
        parentGrid.SetCoordColBlocked(curr_coords);
    }
}

// Drag End (touchscreen) || Mouse Left Released (mouse)
function OnDragEnd()
{
    isBeingDragged = false;

    if (allAvail) // snap to grid
    {
        ForeachSlot(nearestSlot, Dock);

        // get px coords of the slot
        var slot_x;
        var slot_y;
        var item = id;

        with (nearestSlot)
        {
            slot_x = x;
            slot_y = y;
            parentGrid.StoreItem(item);

            // px pos on screen
            // prevPxPosOfOrigin = new Vector2(x, y); // for stretch goal
        }

        // move the item to the slot
        // TODO: bug: need to include the offset to the center! for items whose center is on a line.
        x = slot_x;
        y = slot_y;
    }
    else 
    {
        /*
           Stretch goal: snap back to prev pos on release when released over
           another piece or invalid grid pos, but not when released outside grid.

           2 player intents here.
           1. they wanna let go on open space and let it stay there
           2. they wanna let go on invalid gridSpace and make it snap back to orig
         */

        /*
           if (prevPxPosOfOrigin == noone) return; // item has never docked before

        // move item back to prev position
        x = prevPxPosOfOrigin.x;
        y = prevPxPosOfOrigin.y;
         */
    }
    // stretch goal for UI: dock to nearest avail place, then back to original when nearest got no space. 
    // for that: new fn
    // if nearestList[| 0] not allAvail, repeat with nearestList[| 1].
    // if that is not allAvail, repeat with [| 2] and [| 3].
    // if [| 3] is also not allAvail, show the [| 1] outline being unavail
}

function Dock(parentGrid, curr_coords)
{
    if (parentGrid.CoordIsOutsideGrid(curr_coords)) return;

    parentGrid.DockSlot(curr_coords);
}

function RotateL()
{
    Rotate(false);
}

function RotateR()
{
    Rotate(true);
}

function Rotate(isClockwise90)
{
    var xEven = boundingLenX % 2 == 0;
    var yEven = boundingLenY % 2 == 0;

    for (var i = 0; i < size; i++)
    {
        if (xEven && yEven) // eg 2x4 item
        {
            if (isClockwise90)
            {
                curr = occupiedSquares[i]; // type: Vector2
                curr.flip();
                curr.x = -curr.x;
                curr.y--;

                /*
                Swap(_x, _y);
                _x = -_x;
                _y--;
                */
            }
            else
            {
                _y++;
                _x = -_x;
                Swap(_x, _y);
            }
        }

        if (xEven && !yEven) // eg 2x3 item
        {
            if (isClockwise90)
            {
                Swap(_x, _y);
                _y--;
                _x = -_x;
            }
            else
            {
                _x = -_x;
                Swap(_x, _y);
            }
            Swap(boundingLenX, boundingLenY);
        }

        if (!xEven && yEven) // eg 1x2 item
        {
            if (isClockwise90)
            {
                Swap(_x, _y);
                _x = -_x;
            }
            else
            {
                _y++;
                _x = -_x;
                Swap(_x, _y);
            }
            Swap(boundingLenX, boundingLenY);
        }

        if (!xEven && !yEven) // eg 3x1 item
        {
            if (isClockwise90)
            {
                Swap(_x, _y);
                _x = -_x;
            }
            else
            {
                _x = -_x;
                Swap(_x, _y);
            }
        }
    }
}

function FlipHrz()
{
    if (xEven)
    {
        _x = 1 -_x;
    }
    else
    {
        _x = -_x;
    }
}

