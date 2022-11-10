/// @description Initialise Timer fn.
// can use globals for this to talk with the trip manager.

// public vars that must be overwritten in children
endFn = global.tripManager.OnTripEnd;
difficultyTime = global.midTime;
textOnBar = "PATIENCE";
timeOverMsg = "IIIIIIIII'MMMMMMMMM LAAAATEEEEEEEEE!!!!!!!!!!!";
endReactionTime = 3;
isEnded = false;
barTextOffset = 2;

sprite_idx = 0;

bar_width = 350;
bar_height = 20;

bar_x = x;
bar_y = y + 50;

lastTripX = 485;
lastTripY = 680;

function Init()
{
    // reduce time depending on day
    if (global.day == 2) difficultyTime -= global.day2TimeReduction;
    if (global.day == 3) difficultyTime -= global.day3TimeReduction;

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

function ResumeTimer()
{
	timeIsRunning = true;
}

function Scream()
{
	if (!isEnded) // once the time reaches 0
	{
		textOnBar = "";
		isEnded = true;
	}
	if (timeOverMsg != "") // when there are things to add to the text
	{
		textOnBar += string_char_at(timeOverMsg, 1);
		timeOverMsg = string_delete(timeOverMsg, 1, 1);
		audio_play_sound(TimeOver, 10, 0);
	}
	else // when the text runs out
	{
		// textOnBar += "!"; // makes text exceed screen, abit messy.
	}
}

Init();