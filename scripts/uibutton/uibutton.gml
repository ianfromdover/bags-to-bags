function UiButton(_fn) constructor
{
    fn = _fn;
	
	static OnClick = function()
	{
        fn();
        exit;
	}
}

function UiButtonOneArg(_fn, _a) constructor
{
    fn = _fn;
    a = _a;
	
	static OnClick = function()
	{
        fn(a);
        exit;
	}
}

