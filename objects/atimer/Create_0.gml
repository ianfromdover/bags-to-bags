/// @description Initialise Timer fn.
// can use globals for this to talk with the trip manager.

// public vars that must be overwritten in children
endFn = global.tripManager.OnTripEnd;
difficultyTime = global.easyTime;
sprite_idx = 0;
textOnBar = "PATIENCE";
timeOverMsg = "IIIIIIIII'MMMMMMMMM LAAAATEEEEEEEEE!!!!!!!!!!!!!!!!!!!!";
endReactionTime = 3;
isEnded = false;
barTextOffset = 2;

bar_width = 350;
bar_height = 20;

bar_x = x;
bar_y = y + 50;

lastTripX = 630;
lastTripY = 20;

function Init()
{
	if (difficultyTime > global.dayTimeLeft)
	{
		global.isLastTripOfDay = true;
		instance_create_layer(lastTripX, lastTripY, "UI", oLastTrip);
	}
	
	global.activeTimer = id;
	less15Flag = false;
	less0Flag = false;
	timeIsRunning = true;
	
	displayedTime = difficultyTime;
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
		// textOnBar += "!"; // makes text exceed screen, abit messy.
	}
}

Init();
