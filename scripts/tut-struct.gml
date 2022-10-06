// Utility function for smoothly interpolating between 2 positions
function Lerp(start, dest, currTime, duration) // start currtime at 0
{
	change = dest - start;
	currTime /= duration / 2; // value ranges from [0, 1]
	
	if (currTime < 1)
	{
		return ((change / 2) * currTime * currTime + dest);
	}
	else
	{
		return ((-change / 2) * (currTime * (currTime - 2) - 1) + dest);
	}
}

// this is how you make an object in gml
function Vector2(_x, _y) constructor
{
    x = _x; // attributes
    y = _y;

    static Add = function(_vec2) // methods
    {
        x += _vec2.x;
        y += _vec2.y;
    }
}

// you can instantiate the struct like this
v2 = new Vector2(10, 10);

// rememeber to delete created structs for the garbage collection when they are done
delete v2;

// and this is how inheritance works
function Vector3(_x, _y, _z) : Vector2(_x, _y) constructor
{
    z = _z;

    static Add = function( _vec3 )
    {
        x += _vec3.x;
        y += _vec3.y;
        z += _vec3.z;
    }
}

// using inheritance for children to pass set args
function Bag(_size) constructor
{
    size = _size;

    static Delete = function()
    {
        size = 0;
    }
}

function BagT() : Bag(5) constructor {}

var _t_shaped_bag = new BagT();
show_debug_message(_t_shaped_bag.size); // shows 5

