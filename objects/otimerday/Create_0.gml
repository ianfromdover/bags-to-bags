/// @description Initialise Timer fn.

displayedTime = global.dayTimeLeft; // overridden in room start
difficultyTime = global.maxDayTime;
endReactionTime = 3;
textOnBar = "TIME LEFT";
timeOverMsg = "I'M TIIIIIIIIIRED!!!!!!!!!!!!!!!!!";
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
	less15Flag = false;
	less0Flag = false;
	timeIsRunning = true;
	currTime = displayedTime;
}

function OnEnd()
{
    timeIsRunning = false;
	OnDayEnd();
}

function StopTimer() // called by the pause button
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
