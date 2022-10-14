/// @description Initialise Timer fn.

displayedTime = global.dayTimeMax;
timeIsRunning = true;

Init();

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
    // "time has ended" alert
	timeIsRunning = false;
	room_goto(EndOfDay);
}

function StopTimer()
{
	timeIsRunning = false;
}
