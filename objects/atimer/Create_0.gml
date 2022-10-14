/// @description Initialise Timer fn.
// can use globals for this to talk with the trip manager.

endFn = 0; // assigned in room start
displayedTime = global.easyTime;
timeIsRunning = true;


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
    endFn();
}

function StopTimer()
{
	timeIsRunning = false;
}
