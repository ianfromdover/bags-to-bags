/// @description Initialise Timer fn.
// can use globals for this to talk with the trip manager.

endFn = global.tripManager.OnSubmit;
arg = EndTripScene;
displayedTime = global.easyTime;

function Init()
{
	global.activeTimer = id;
	
	if (displayedTime > global.dayTimeLeft)
	{
		displayedTime = global.dayTimeLeft;
	}
	
	currTime = displayedTime;
}

function OnEnd()
{
    endFn(arg);
}
