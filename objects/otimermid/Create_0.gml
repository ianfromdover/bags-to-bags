/// @description Initialise Timer fn.
// can use globals for this to talk with the trip manager.

// public vars that must be overwritten in children
endFn = global.tripManager.OnTripEnd;
difficultyTime = global.midTime;

function Init()
{
	global.activeTimer = id;
	isLastFewSeconds = false;
	timeIsRunning = true;
	
	if (difficultyTime > global.dayTimeLeft)
	{
		displayedTime = global.dayTimeLeft;
	}
	else
	{
		displayedTime = difficultyTime;
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

Init();