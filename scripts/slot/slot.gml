function Slot(_id, _parentGrid, _a, _b) constructor
{
    // attributes
    this = _id;
    parentGrid = _parentGrid;
    coords = new Vector2(_a, _b); // coords in the grid, with (0, 0) at btm left corner
    dockedItem = noone; // the parent object of the squares that it occupies
    isOccupied = false;
    with(this)
    {
        image_speed = 0;
        image_index = 0; // 0 = nothing hovering, 1 = available, 2 = occupied
    }

	// --------------------------
	// ----- public methods -----
	// --------------------------

    static GetCoords = function()
    {
        return coords;
    }

    static CheckOccupied = function()
    {
        return isOccupied;
    }

    static Dock = function(_itemId)
    {
        dockedItem = _itemId; // the logic item
        isOccupied = true;
    }

    static Undock = function()
    {
        dockedItem = noone;
        isOccupied = false;
    }

    static SetColAvail = function()
    {
        SetColor("avail");
    }

    static SetColBlocked = function()
    {
        SetColor("occupied");
    }

    static SetColDefault = function()
    {
        SetColor("default");
    }

    static Destroy = function()
    {
        instance_destroy();
    }

	// ---------------------------
	// ----- private methods -----
	// ---------------------------

    static SetColor = function(_col)
    {
        with (this)
        {
            switch(_col)
            {
                case "avail":
                    image_index = 1;
                    break;
                case "occupied":
                    image_index = 2;
                    break;
                default: // nothing hovering over
                    image_index = 0;
            }
        }
    }
}
