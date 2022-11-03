/// @description Initialise Timer fn.

displayedTime = global.dayTimeLeft; // overridden in room start
timeIsRunning = true;
isLastFewSeconds = false;
endReactionTime = 3;
textOnBar = "PATIENCE";
timeOverMsg = "I'M TIIIIIIRED!";
isEnded = false; // CHECK IF SCREAMING IS THE SAME AS IN USUAL ATIMER IN DRAW EVENT
barTextOffset = 2;

sprite_idx = 0;

bar_width = 350;
bar_height = 20;

bar_x = x;
bar_y = y + 50;

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


function Scream()
{
	if (!isEnded)
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