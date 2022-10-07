function Slot() constructor
{
    // attributes
    dockedItem = null; // the parent object of the squares that it occupies
    isOccupied = false;
    isHoveredOver = false; // by an item

    static CheckAvail = function()
    {
        if (isHoveredOver)
        {
            return isOccupied;
        }
        // set colours outside?
    }

    static SetColor = function()
    {
        // set green, red or grey
        switch(_col)
        {
            case "green":
                // set green
            break;
            case "red":
                // set red
            break;
            default:
                // set grey
        }
    }

    static SetGreen = function()
    {
        SetColor("green");
    }

    static SetRed = function()
    {
        SetColor("red");
    }

    static SetGrey = function()
    {
        SetColor("grey");
    }

}
