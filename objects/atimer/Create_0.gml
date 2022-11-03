/// @description Initialise Timer fn.
// can use globals for this to talk with the trip manager.

// public vars that must be overwritten in children
endFn = global.tripManager.OnTripEnd;
difficultyTime = global.easyTime;
sprite_idx = 0;
textOnBar = "PATIENCE";
timeOverMsg = "IIIIIIIII'MMMMMMMMM LAAAATEEEEEEEEE!";
endReactionTime = 3;
isEnded = false;
barTextOffset = 2;

bar_width = 350;
bar_height = 20;

bar_x = x;
bar_y = y + 50;


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

Init();