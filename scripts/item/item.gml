function Item(_id) constructor
// function Item(_id, s, occArr) constructor // parent of a bag
// use the next one when trying to calc snapping.
// the indiv offsets and len calc is done in each create child in editor
{
	// -----------------------
	// ----- attributes  -----
	// -----------------------

    this = _id;
    isStealable = false; // true for valuables and illegals

    // for docking
	size = 0; // set these in the constructor
	occupiedSquares = [];
    canDock = false;
    prevGridPosOfOrigin = Vector2(); // grid coords
    allAvail = true; // note: can't be accessed in the with-block
    // origin is at (25, 25) px for each sprite

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

        // save item's offset
        with (this)
        {
            cursorOffsetX = x - cursor_x;
            cursorOffsetY = y - cursor_y;
        }
    }

	static Undock = function() // with Trunk
	{
		// for each occupiedSquare
        for ( i = 0; i < size; i++)
        {
			// set item to noone for each slot
            // global item being dragged = this
        }
	}
	
    static Follow = function(cursor_x, cursor_y)
    {
        if (!isBeingDragged) exit; // this case only happens in Step event

        HoverCheck(); // talks with the trunk in the room

        with (this)
        {
            // make item follow cursor
            x = cursor_x + cursorOffsetX;
            y = cursor_y + cursorOffsetY;
        }

    }

    // chks if piece's placement on grid will be free
    // this should be heavily optimised. delete all structs lists and vars
    static HoverCheck = function(_x, _y)
    {
        // 1. determine nearest squares to middle of hovering piece
        var _nearestList = new List();
        // _x, _y should be the curr position of the center of the item
        numHits = instance_place_list(_x, _y, oSlot, _nearestList, true); // sort by dist

        allAvail = true; // note: can't be accessed in the with-block
        // may wanna move the check to another script or the param into the constructor

        // 2. check each anticipated slot if is free (perhaps this should be its own fn) but then again level of abstraction should be constant.
            // i. should have helper function that takes in list of posns and for each slot activates its API
        with (_nearestList.getValue(0)) // for nearest hit,
        {
            // imagine the piece placed centrally on that
                // how to determine the center?
            // try to fit the square segments into anticipated position
                // checks if 
                    // piece is dropped over slots which are not free
                    // piece is dropped outside the grid (aka grid index > max grid idx)
            // for each square attempted, CheckOccupied()
            // allAvail = AND the bools of all squares.  should this be executed by trunk?
        }

        // 3. set colour
		/*
        if (allAvail)
        {
            for (each slot) with (that slot) SetColAvail(); // the cols
        }
        else
        {
            for (each slot) with (that slot) SetColBlocked();
        }
		*/
        // when will the slot set itself to be default? idw slots to check every frame.
        // it should set default once there isnt a piece hovering. how does piece do that? piece is unable to tell when it exits tho.
        // can we use isBeingDragged here?
        // so slot is start of frame set default, before frame is drawn it sets to colour if got piece.
        // else, set col first, then set default at end of frame that we dont see it

        // clean up
        _nearestList = _nearestList.destroy();
    }
	
	// Drag End (touchscreen) || Mouse Left Released (mouse)
    static OnDragEnd = function()
    {
        isBeingDragged = false;
        if (allAvail)
        {
            // prev pos = this new pos
            // for (each slot) with (that slot) Dock(this); // each slot in occupiedSquares
        }
        else 
        {
            // dock the piece back to its original place
            // piece pos = this.prevGridPosOfOrigin
            // stretch goal for UI: dock to nearest avail place, then back to original when nearest got no space. this is possible with the nearest list. but it needs to be outside that function
            // item being dragged = null
        }
    }
}

