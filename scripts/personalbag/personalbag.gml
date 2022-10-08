function PersonalBag(_id) constructor
{
    // stage 1: always open.
	// stage 2: search youtube for GML windowed-menu systems
	this = _id;
	items = []; // size limit = 10
    // each item should have a 3x3 grid for them to lock to
    // the user is likely to keep the personal bag open while they
    // shuffle things in and out.

    static Store = function(_item) // triggered by placing things inside.
    {
        // items.get(bb
        // https://github.com/Mtax-Development/GML-OOP/wiki/Examples
    }

    static TakeOut = function(_item)
    {
        // items.remove(_item);
    }
}
