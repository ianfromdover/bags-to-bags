/// @description oSlot, a slot in the grid
image_speed = 0; // dont auto change tweens
image_index = 0; // 0 = nothing hovering, 1 = available, 2 = occupied
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

function Dock() // on mouse release
{
    isOccupied = true;
}

function Undock() // on mouse press
{
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
    }
}

