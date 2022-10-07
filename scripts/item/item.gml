function Item() constructor // parent of a bag
{
	// attributes
	size = 4;
	occupiedSquares = [];
    originCoords = Vector2();
	prevGridPosOfOrigin = Vector2();
	
	// methods
	// OnDragStart
	static Undock = function()
	{
		// for each occupiedSquare
        for (var i = 0; i < size; i++)
        {
			// set item to noone for each slot
            // global item being dragged = this
        }

        // cursorOffset = fingerCoordsXY - originXY (screen coords)
	}
	
	// OnDragging
    static Follow = function()
    {
        // pieceParentXY = mouse.pos + originOffset
    }

    static HoverCheck = function()
    {
        // get the nearest slot
        // compare 9? nearest squares to the center of the item
        // for the dist nearest one, try to fit pieces in that
        // what does this return?

        canDock = allAvail; // bool
        // return (&& calling the CheckAvail() of each slot it's over)
        // if (allAvail)
        {
            // for (each slot)
            {
                // set green
                // else red
            }
        }
    }
	
	// OnDragEnd
    static Drop = function()
    {
        if (canDock)
        {
            // for each slot
            Dock();
        }
        else // includes dropping outside the grid
        {
            // dock the piece back to its original place
            // pos = this.prevGridPosOfOrigin
            // stretch goal for UI: dock to nearest avail place, then back to original when nearest got no space
            // item being dragged = null
        }
    }

    static Dock = function() // called only when canDock
    {
        // assign slots to contain this object
        // for each coord in occupiedSquares
        {
            // coord.DockBag(this);
        }
        // prev pos = this new pos
    }
	
}
