/// @description SlotGrid. Set trunk grid width and height, spawns slots

width = 7;
height = 5;
slotPxLen = 50;

// this checks if the piece is outside the trunk or not.
slots = [];
itemsContained = new List();

// pos of temp slot being initialised
slPosX = (slotPxLen / 2) + x; // first slot at (0, 0) btm left of grid
slPosY = (slotPxLen / 2) + y;

// create slots
for (var i = 0; i < width; i++)
{
    slots[i] = array_create(height, noone);

    for (var j = 0; j < height; j++)
    {
        // create slot and instantiate my code logic
        var inst = instance_create_layer(slPosX, slPosY, "Slots", oSlot); // yes
        with (inst)
        {
            parentGrid = self;
            coords = new Vector2(i, j); // (0, 0) btm left corner
        }

        // put into array
        slots[i][j] = inst;

        // spawn the next slot above
        slPosY += slotPxLen;
    }

    // reset Y pos to base height and move right 1 slot
    slPosY = slotPxLen / 2 + y;
    slPosX += slotPxLen;
}

// --------------------------
// ----- public methods -----
// --------------------------

function CoordIsOccupied(_slot_coords)
{
    slot = slots[_slot_coords.x][_slot_coords.y];
    return slot.CheckOccupied();
}

function CoordIsOutsideGrid(_slot_coords)
{
    return _slot_coords.x < 0 
        || _slot_coords.y < 0
        || _slot_coords.x >= width
        || _slot_coords.y >= height;
}

function SetCoordColAvail(_slot_coords)
{
    slots[_slot_coords.x][_slot_coords.y].SetColAvail();
}

function SetCoordColBlocked(_slot_coords)
{
    slots[_slot_coords.x][_slot_coords.y].SetColBlocked();
}

function DockSlots(_slot_coords, _item)
{
    slots[_slot_coords.x][_slot_coords.y].Dock(_item);
    itemsContained.add(_item);
}

function UndockSlots(_slot_coords)
{
    slots[_slot_coords.x][_slot_coords.y].Undock();
    itemsContained.removeValue(_item);
}

function SetAllColDef()
{
    for (var i = 0; i < width; i++)
    {
        for (var j = 0; j < height; j++) slots[i][j].SetColDefault();
    }
}

function Destroy()
{
    for (var i = 0; i < width; i++)
    {
        for (var j = 0; j < height; j++) slots[i][j].Destroy();
    }
    // TODO: destroy self
}
