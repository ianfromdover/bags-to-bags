function Item(_id, _isStealable, _occArr) constructor
{
	// -----------------------
	// ----- attributes  -----
	// -----------------------

    this = _id;

    // for docking
    isStealable = _isStealable; // implement chk to collide with personal bag
    occupiedSquares = _occArr;
    // for pieces with an even no. of sides, it is at btm left corner
	size = array_length(_occArr);

    prevGridPosOfOrigin = noone;
    nearestSlot = noone;
    allAvail = true;

    // for dragging
	isBeingDragged = false;
	cursorOffsetX = 0;
	cursorOffsetY = 0;
    
	// -------------------
	// ----- methods -----
	// -------------------

	// Drag Start (touchscreen) || Mouse Left Pressed (mouse)
    static OnDragStart = function(cursor_x, cursor_y)
    {
        Undock();
        isBeingDragged = true;
        var temp_c_offst_x;
        var temp_c_offst_y;

        // save item's offset
        with (this)
        {
            temp_c_offst_x = x - cursor_x;
            temp_c_offst_y = y - cursor_y;
        }

        cursorOffsetX = temp_c_offst_x;
        cursorOffsetY = temp_c_offst_y;
    }

	static Undock = function() // with Trunk
	{
        var _size = size;
        var _occupiedSquares = occupiedSquares;
        if (nearestSlot == noone) exit;

        with (nearestSlot)
        {
            for (var i = 0; i < _size; i++)
            {
                var curr_coords = coords.sum(_occupiedSquares[i]);
                parentGrid.UndockSlots(curr_coords);
            }
        }
	}
	
    static Follow = function(cursor_x, cursor_y)
    {
        if (!isBeingDragged) exit; // only triggered in Step event

        var new_item_x = cursor_x + cursorOffsetX;
        var new_item_y = cursor_y + cursorOffsetY;
        HoverCheck(new_item_x, new_item_y); // talks with the slot it hovers over

        with (this)
        {
            // make item follow cursor
            x = new_item_x;
            y = new_item_y;
        }
    }

    // chks if piece's placement on grid will be free
    // TODO: heavily optimise. delete all structs lists and vars
    static HoverCheck = function(_x, _y)
    {
        // 1. determine nearest squares to middle of hovering piece
        var _nearestList = new List();
        var tempNearestSlot; // can't be accessed in the with-block unless is a var.
        var tempAllAvail = true;
        var _size = size;
        var _occupiedSquares = occupiedSquares;


        // find nearest slot to center of item
		// use the collision mask of the instance that runs the code for the check.
		with (this)
		{
			instance_place_list(_x, _y, oSlot, _nearestList, true); // sort by dist
			tempNearestSlot = _nearestList.getValue(0);
		}

        // 2. check each anticipated slot if is free
        if (is_undefined(tempNearestSlot))
        {
            // for ending drag
            allAvail = false;
            nearestSlot = noone;

            // clean up
            _nearestList = _nearestList.destroy();
            exit;
        }

        with (tempNearestSlot.this)
        {
            // can we use isBeingDragged here? to make it more optimised?
            // reset previous squares' colour first
            parentGrid.SetAllColDef();

            // try to fit the square segments into anticipated position
            for (var i = 0; i < _size; i++) // make into helper fn. list of grid posns, for each slot, activate api
            {
                var curr_coords = coords.sum(_occupiedSquares[i]); // assumes occupiedSquares (0, 0) is at center of item
                // check is piece dropped outside the grid?
                if (parentGrid.CoordIsOutsideGrid(curr_coords)
                // check is piece dropped over a slot which is occupied?
                 || parentGrid.CoordIsOccupied(curr_coords))
                {
                    tempAllAvail = false;
                    break;
                }
            }

            if (tempAllAvail == false) exit;

            // 3. set colour
            for (var i = 0; i < _size; i++)
            {
                var curr_coords = coords.sum(_occupiedSquares[i]);
                if (tempAllAvail)
                {
                    parentGrid.SetCoordColAvail(curr_coords);
                }
                else
                {
                    parentGrid.SetCoordColBlocked(curr_coords);
                }
            }
        }

        // for ending drag
        allAvail = tempAllAvail;
        nearestSlot = tempNearestSlot;

        // clean up
        _nearestList = _nearestList.destroy();
    }
	
	// Drag End (touchscreen) || Mouse Left Released (mouse)
    static OnDragEnd = function()
    {
        isBeingDragged = false;
        var _size = size;
        var _occupiedSquares = occupiedSquares;

        if (allAvail)
        {
            var slot_x;
            var slot_y;

            with (nearestSlot)
            {
                slot_x = x;
                slot_y = y;

                prevGridPosOfOrigin = new Vector2(x, y);
                for (var i = 0; i < _size; i++)
                {
                    var curr_coords = coords.sum(_occupiedSquares[i]);
                    parentGrid.DockSlots(curr_coords, this);
                }
            }

            with (this) // move the item to the slot
            {
                // x = slot_x; // causes error cuz slot = null.
                // y = slot_y;
            }
        }
        else 
        {
            if (prevGridPosOfOrigin == noone) exit;

            with (this) // move the item back
            {
                x = prevGridPosOfOrigin.x;
                y = prevGridPosOfOrigin.y;
            }
            // stretch goal for UI: dock to nearest avail place, then back to original when nearest got no space. 
            // this is possible with the nearest list. but it needs to be outside that function
        }
    }
}

