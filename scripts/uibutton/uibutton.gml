function UiButton(_fn) constructor
{
    fn = _fn;
	
	static OnClick = function()
	{
		if (global.itemBeingDragged == noone) fn();
        exit;
	}
}

function UiButtonOneArg(_fn, _a) constructor
{
    fn = _fn;
    a = _a;
	
	static OnClick = function()
	{
        if (global.itemBeingDragged == noone) fn(a);
        exit;
	}
}

function ControlButton(_fn) constructor
{
    fn = _fn;
	
	static OnClick = function()
	{
		fn();
        exit;
	}
}
