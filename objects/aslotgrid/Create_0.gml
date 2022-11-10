/// @description SlotGrid. Set trunk grid width and height, spawns slots

width = 7; // to edit, override in Room Start Event, then call the Init();
height = 5;
slotPxLen = 50;

// this checks if the piece is outside the trunk or not.
slots = [];
itemsContained = new Set();

function Init(isTrunk) // create slots
{
    if (isTrunk)
    {
        global.activeTrunk = id;
    }
    else
    {
        global.activePersBag = id;
    }
    // assumption: if it is not a trunk, it is a personal bag

    // pos of temp slot being initialised
    slPosX = (slotPxLen / 2) + x; // first slot at (0, 0) top left of grid
    slPosY = (slotPxLen / 2) + y;

    for (var i = 0; i < width; i++)
    {
        slots[i] = array_create(height, noone);

        for (var j = 0; j < height; j++)
        {
            // create slot and instantiate my code logic
            var inst = instance_create_layer(slPosX, slPosY, "Slots", oSlot);
            with (inst)
            {
                parentGrid = other; // this grid
                coords = new Vector2(i, j); // (0, 0) top left corner
            }

            // put into array
            slots[i][j] = inst;

            // spawn the next slot below
            slPosY += slotPxLen;
        }

        // reset Y pos to base height and move right 1 slot
        slPosY = slotPxLen / 2 + y;
        slPosX += slotPxLen;
    }
}

// --------------------------
// ----- public methods -----
// --------------------------

// check is piece dropped over a slot which is occupied?
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

function CoordIsAvail(_slot_coords)
{
    if (CoordIsOutsideGrid(_slot_coords))
    {
        return false;
    }

    return !CoordIsOccupied(_slot_coords);
}

function SetCoordColAvail(_slot_coords)
{
    slots[_slot_coords.x][_slot_coords.y].SetColAvail();
}

function SetCoordColBlocked(_slot_coords)
{
    slots[_slot_coords.x][_slot_coords.y].SetColBlocked();
}

// called once on dock
function StoreItem(_item)
{
    itemsContained.add(_item);
}

// called once on undock
function TakeOutItem(_item)
{
    itemsContained.removeValue(_item);
}

// called by for loop in aItem, as many times as coords
function DockSlot(_slot_coords)
{
    slots[_slot_coords.x][_slot_coords.y].Dock();
}

// called by for loop in aItem, as many times as coords
function UndockSlot(_slot_coords)
{
    slots[_slot_coords.x][_slot_coords.y].Undock();
}

// Set all the colours of the grid to default
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
}
