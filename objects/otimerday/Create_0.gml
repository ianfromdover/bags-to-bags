/// @description Initialise Timer fn.

displayedTime = global.dayTimeLeft; // overridden in room start
timeIsRunning = true;
isLastFewSeconds = false;

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
    // tell the player that "time has ended" to give them time to react
	OnDayEnd();
}

function StopTimer() // called by the pause button
{
	timeIsRunning = false;
}

function RestartTimer() // resume button
{
	timeIsRunning = true;
}
