function SlotGrid(_id, _x, _y, _width, _height, _slotLengthPx) constructor
{
	// this checks if the piece is outside the trunk or not.
	this = _id;
    slots = [];
    itemsContained = []; // can push using array_push(itemsContained, item);

    // pos of temp slot being initialised
    slPosX = (_slotLengthPx / 2) + _x; // first slot at top right of trunk
    slPosY = (_slotLengthPx / 2) + _y;
    width = _width;
    height = _height;

    for (var i = 0; i < width; i++)
    {
        slots[i] = array_create(height, noone);

        for (var j = 0; j < height; j++)
        {
            // create slot and instantiate my code logic
            var inst = instance_create_layer(slPosX, slPosY, "Slots", oSlot); // yes
            var slotLogic = new Slot(inst, self, i, j);
            with (inst)
            {
                this = slotLogic;
            }

            // put into array
            slots[i][j] = slotLogic;

            // spawn the next slot above
            slPosY += _slotLengthPx;
        }

        // reset Y pos to base height and move right 1 slot
        slPosY = _slotLengthPx / 2 + _y;
        slPosX += _slotLengthPx;
    }

	// --------------------------
	// ----- public methods -----
	// --------------------------

    static CoordIsOccupied = function(_slot_coords)
    {
        slot = slots[_slot_coords.x][_slot_coords.y];
        return slot.CheckOccupied();
    }

    static CoordIsOutsideGrid = function(_slot_coords)
    {
        return _slot_coords.x < 0 
            || _slot_coords.y < 0
            || _slot_coords.x >= width
            || _slot_coords.y >= height;
    }

    static SetCoordColAvail = function(_slot_coords)
    {
        slots[_slot_coords.x][_slot_coords.y].SetColAvail();
    }

    static SetCoordColBlocked = function(_slot_coords)
    {
        slots[_slot_coords.x][_slot_coords.y].SetColBlocked();
    }

    static DockSlots = function(_slot_coords, _item)
    {
        slots[_slot_coords.x][_slot_coords.y].Dock(_item);
    }

    static UndockSlots = function(_slot_coords)
    {
        slots[_slot_coords.x][_slot_coords.y].Undock();
    }

    static SetAllColDef = function()
    {
        for (var i = 0; i < width; i++)
        {
            for (var j = 0; j < height; j++) slots[i][j].SetColDefault();
        }
    }

    static Destroy = function()
    {
        for (var i = 0; i < width; i++)
        {
            for (var j = 0; j < height; j++) slots[i][j].Destroy();
        }
    }
}
