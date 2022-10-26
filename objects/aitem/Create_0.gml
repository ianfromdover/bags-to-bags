/// @description aItem, an abstract item
// add unique item properties using the Room Start event instead.

// -----------------------
// ----- attributes  -----
// -----------------------
isStealable = false; // implement chk to collide with personal bag

occupiedSquares = []; // populated during Room Start
size = 0; // no of occ squares, filled during Room Start by Init

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

function Init()
{
    size = array_length(occupiedSquares);
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
        for (var i = 0; i < _size; i++)
        {
            var curr_coords = coords.sum(_occupiedSquares[i]);
            fn(parentGrid, curr_coords);
        }
    }
}

// Drag Start (touchscreen) || Mouse Left Pressed (mouse)
function OnDragStart(cursor_x, cursor_y)
{
    // Undock();
    isBeingDragged = true;

    // save cursor offset
    cursorOffsetX = x - cursor_x;
    cursorOffsetY = y - cursor_y;
}

function Undock() // with Trunk
{
    var _occupiedSquares = occupiedSquares;
    var _size = size;
    if (nearestSlot == noone) exit; // piece is not docked

    with (nearestSlot) // the anchor for the piece
    {
        for (var i = 0; i < _size; i++) // for each coord in array
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
    HoverCheck(); // ask the slot to change col depending on availabilit
}

// chks if piece's placement on grid will be free
function HoverCheck()
{
	// 1. determine nearest slot to center of hovering piece
	var nearestList = ds_list_create();
	var _occupiedSquares = occupiedSquares;
    var _size = size;
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
        exit;
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
	    return; // now is just a Continue, make it break.
    }
}

function SetSlotCol(parentGrid, curr_coords)
{
    if (!parentGrid.CoordIsAvail(curr_coords))
    {
        return;
    }

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
    var _occupiedSquares = occupiedSquares;

    /*
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
            for (var i = 0; i < _size; i++)
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
    */
}
