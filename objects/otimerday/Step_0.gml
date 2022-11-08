/// @description Countdown each second

if (timeIsRunning)
{
	
	if (currTime < -endReactionTime)
	{
		currTime = difficultyTime;
		OnEnd();
	}
	if (currTime < 0) // time has run out
	{
		if (!less0Flag)
		{
			displayedTime = 0;
			less0Flag = true;
		}
		
		audio_play_sound(TimeOver, 10, 0);
		Scream();
		currTime -= (delta_time / 1000000) // convert microseconds into seconds
	}
	else // subtract the time between frames
	{
		currTime -= (delta_time / 1000000) // convert microseconds into seconds
		newDisplayedTime = ceil(currTime); // round up to nearest int
		if (less15Flag && newDisplayedTime != displayedTime) audio_play_sound(TimeWarn, 10, 0);
		displayedTime = newDisplayedTime;
	}
}

if (!less15Flag && displayedTime <= 15)
{
	less15Flag = true;
	audio_play_sound(TimeWarn, 10, 0);
}

