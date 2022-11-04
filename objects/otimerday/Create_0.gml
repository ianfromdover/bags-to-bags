/// @description Initialise Timer fn.

displayedTime = global.dayTimeLeft; // overridden in room start
difficultyTime = global.maxDayTime;
timeIsRunning = true;
isLastFewSeconds = false;
endReactionTime = 3;
textOnBar = "TIME LEFT";
timeOverMsg = "I'M TIIIIIIRED!";
isEnded = false;
barTextOffset = 2;

sprite_idx = 0;

bar_width = 350;
bar_height = 20;

bar_x = x;
bar_y = y + 50;

function Init() // need to call when room starts.
{
	global.activeTimer = id;
	timeIsRunning = true;
	
	if (displayedTime > global.dayTimeLeft)
	{
		displayedTime = global.dayTimeLeft;
	}
	
	currTime = displayedTime;
}

function OnEnd()
{
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


function Scream()
{
	if (!isEnded) // one-time flag
	{
		textOnBar = "";
		isEnded = true;
	}
	if (timeOverMsg != "")
	{
		textOnBar += string_char_at(timeOverMsg, 1);
		timeOverMsg = string_delete(timeOverMsg, 1, 1);
	}
	else
	{
		textOnBar += "!";
	}
}
