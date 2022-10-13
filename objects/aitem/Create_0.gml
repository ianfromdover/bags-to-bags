/// @description Init Item
// TODO: paste over each child item

// -----------------------
// ----- attributes  -----
// -----------------------
isStealable = false; // implement chk to collide with personal bag

// squares the item has, relative to the center
// for pieces with an even no. of sides, it is at btm left corner
a = new Vector2(0, 0);
b = new Vector2(1, 0);

// add the coords above to the array
occupiedSquares = [a, b];

size = array_length(occupiedSquares);

// ---------------------
// ----- temp vars -----
// ---------------------

prevPxPosOfOrigin = noone; // type: Vector2
nearestSlot = noone; // type: oSlot, slot that is nearest to the 'center' of the piece. this slot is the anchor of reference on the item when it is on the grid.
allAvail = true;
isBeingDragged = false;
cursorOffsetX = 0;
cursorOffsetY = 0;

// -------------------
// ----- methods -----
// -------------------

// Drag Start (touchscreen) || Mouse Left Pressed (mouse)
function OnDragStart(cursor_x, cursor_y)
{
    Undock();
    isBeingDragged = true;

    // save cursor offset
    cursorOffsetX = x - cursor_x;
    cursorOffsetY = y - cursor_y;
}

function Undock() // with Trunk
{
    var _occupiedSquares = occupiedSquares;
    if (nearestSlot == noone) exit; // piece is not docked

    with (nearestSlot) // the anchor for the piece
    {
        for (var i = 0; i < size; i++) // for each coord in array
        {
            var curr_coords = coords.sum(_occupiedSquares[i]); // get each relative
            parentGrid.UndockSlots(curr_coords);
        }
    }
}

function Follow(cursor_x, cursor_y)
{
    if (!isBeingDragged) exit; // this line is triggered in Step event

    x = cursor_x + cursorOffsetX;
    y = cursor_y + cursorOffsetY;
    HoverCheck(new_item_x, new_item_y); // ask the slot to change col depending on availability
}

// chks if piece's placement on grid will be free
// TODO: heavily optimise. delete all structs lists and vars when they are done
function HoverCheck(_x, _y)
{
    // 1. determine nearest squares to middle of hovering piece
    var nearestList = new List();

    var _occupiedSquares = occupiedSquares;


    // find nearest slot to center of item
    // use the item's collision mask to check
    instance_place_list(_x, _y, oSlot, nearestList, true); // sort by dist
    nearestSlot = nearestList.getValue(0);

    // 2. check each anticipated slot if is free

    // if the piece is not on a grid
    if (is_undefined(nearestSlot))
    {
        // for ending drag
        allAvail = false;
        nearestSlot = noone;

        // clean up
        nearestList = nearestList.destroy();
        exit;
    }

    with (nearestSlot)
    {
        // reset previous squares' colour first
        // parentGrid.SetAllColDef(); // does the colours reset after each frame?

        // try to fit the square segments into anticipated position
        for (var i = 0; i < size; i++) // make into helper fn. list of grid posns, for each slot, activate api
        {
            var curr_coords = coords.sum(_occupiedSquares[i]);

            // check is piece dropped outside the grid?
            if (parentGrid.CoordIsOutsideGrid(curr_coords)
                // check is piece dropped over a slot which is occupied?
                || parentGrid.CoordIsOccupied(curr_coords))
            {
                AllAvail = false;
                break;
            }
        }

        // 3. set colour
        for (var i = 0; i < size; i++)
        {
            var curr_coords = coords.sum(_occupiedSquares[i]);
            if (AllAvail)
            {
                parentGrid.SetCoordColAvail(curr_coords);
            }
            else
            {
                parentGrid.SetCoordColBlocked(curr_coords);
            }
        }
    }

    // clean up
    nearestList = nearestList.destroy();
}

// Drag End (touchscreen) || Mouse Left Released (mouse)
function OnDragEnd()
{
    isBeingDragged = false;
    var _occupiedSquares = occupiedSquares;

    if (allAvail)
    {
        // get px coords of the slot
        var slot_x;
        var slot_y;
        var item = id;

        with (nearestSlot)
        {
            slot_x = x;
            slot_y = y;

            // px pos on screen
            prevPxPosOfOrigin = new Vector2(x, y);
            // dock item to the slots
            for (var i = 0; i < size; i++)
            {
                var curr_coords = coords.sum(_occupiedSquares[i]);
                parentGrid.DockSlots(curr_coords, item);
            }
        }

        // move the item to the slot
        // bug: need to include the offset to the center!
        x = slot_x;
        y = slot_y;
    }
    else // move item back to prev position
    {
        if (prevPxPosOfOrigin == noone) exit; // item has never docked before

        // move the item back
        x = prevPxPosOfOrigin.x;
        y = prevPxPosOfOrigin.y;
    }
    // stretch goal for UI: dock to nearest avail place, then back to original when nearest got no space. 
    // this is possible with the nearest list. but it needs to be outside that function
}

