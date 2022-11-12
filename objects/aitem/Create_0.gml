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

function Init(blX, blY)
{
    size = array_length(occupiedSquares);
    boundingLenX = blX;
    boundingLenY = blY;
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
    if (global.itemBeingDragged != noone) return;
    UndockSlots();
    isBeingDragged = true;
    global.itemBeingDragged = id;
	audio_play_sound(Rotate, 10, 0);

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
        // stop checking
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
    global.itemBeingDragged = noone;

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
        x = slot_x;
        y = slot_y;
		audio_play_sound(DropBag, 10, 0);
    }
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

// im sorry that this is such terrible hard code, i had a near-unfeasible deadline
function isSquareItem()
{
	// 2x2 squares, are set to (9, 9) bounding box
	return boundingLenX == 9 && boundingLenY == 9;
}

// for even-sided sprites, the bounding box is reframed to an odd number such that rotation works
function Rotate(isClockwise90)
{
    
	if (isSquareItem()) return;
	
	if (isClockwise90)
	{
		image_angle -= 90;
	}
	else
	{
		image_angle += 90;
	}
	audio_play_sound(Rotate, 10, 0);
	
	var xEven = boundingLenX % 2 == 0;
    var yEven = boundingLenY % 2 == 0;

    if (xEven != yEven)
    {
        // swap bounding lengths
        var temp = boundingLenX;
        boundingLenX = boundingLenY;
        boundingLenY = temp;
    }

	// rotate the grid squares that the piece occupies in code
    for (var i = 0; i < size; i++)
    {
        var curr = occupiedSquares[i]; // type: Vector2

        if (isClockwise90)
        {
            curr.flip();
            curr.x = -curr.x;
            if (xEven) curr.y--;
        }
        else // anticlockwise
        {
            if (yEven) curr.y++;
            curr.x = -curr.x;
            curr.flip();
        }

        occupiedSquares[i] = curr;
    }
}

function FlipHrz()
{
    if (isSquareItem()) return;
	
	// flip the occupied squares in code
    for (var i = 0; i < size; i++)
    {
        var curr = occupiedSquares[i]; // type: Vector2

        if (boundingLenX % 2 == 0)
        {
            curr.x = 1 - curr.x;
        }
        else
        {
            curr.x = -curr.x;
        }

        occupiedSquares[i] = curr;
    }

    // flip the sprite
    if (image_angle % 180 == 0)
    {
        image_xscale = -image_xscale;
    }
    else
    {
        image_yscale = -image_yscale;
    }
	audio_play_sound(Rotate, 10, 0);
}

