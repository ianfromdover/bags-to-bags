/// @description oSlot, a slot in the grid
image_speed = 0; // to ensure that slots placed on their own don't flicker
image_index = 0; // 0 = nothing hovering, 1 = available, 2 = occupied
dockedItem = noone; // the parent object of the squares that it occupies
isOccupied = false;

// assigned by SlotGrid
parentGrid = 0;
coords = 0; // Vector2(x, y), with (0, 0) at btm left corner

// --------------------------
// ----- public methods -----
// --------------------------
function GetCoords()
{
    return coords;
}

function CheckOccupied()
{
    return isOccupied;
}

function Dock(_itemId) // on release
{
    dockedItem = _itemId; // TODO: dissolve logic item too
    isOccupied = true;
}

function Undock()
{
    dockedItem = noone;
    isOccupied = false;
}

function SetColAvail()
{
    SetColor("avail");
}

function SetColBlocked()
{
    SetColor("occupied");
}

function SetColDefault()
{
    SetColor("default");
}

function Destroy()
{
    instance_destroy();
}

// ---------------------------
// ----- private methods -----
// ---------------------------

function SetColor(_col)
{
    switch(_col)
    {
        case "avail":
            image_index = 1;
            break;
        case "occupied":
            image_index = 2;
            break;
        case "default":
            image_index = 0;
            break;
        /* idk why this block runs all the time
        default: // nothing hovering over
            image_index = 0;
        */
    }
}

