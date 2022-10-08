function Trunk(_id, _x, _y, _width, _height, _slotLengthPx) constructor
{
	// is this able to instantiate 7x5 slots?
	// this checks if the piece is outside the trunk or not.
	// cuz slot is only one square in the trunk.
	this = _id;
    slots = [];

    // pos of temp slot being initialised
    slPosX = (_slotLengthPx / 2) + _x; // center of first slot placed top right of trunk obj
    slPosY = (_slotLengthPx / 2) + _y;

    for (var i = 0; i < _width; i++)
    {
        slots[i] = array_create(_height, noone);

        for (var j = 0; j < _height; j++)
        {
            // create slot and instantiate my code logic
            var inst = instance_create_layer(slPosX, slPosY, "Instances", oSlot); // yes
            var slotLogic = new Slot(inst, i, j);
            with (inst)
            {
                this = slotLogic; // TODO: debug if this is the slot's id
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

    static Destroy = function()
    {
        for (var i = 0; i < _width; i++)
        {
            for (var j = 0; j < _height; j++) slots[i][j].Destroy();
        }
    }
}
