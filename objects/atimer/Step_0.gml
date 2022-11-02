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
		displayedTime = 0;
		Scream();
		
		
		currTime -= (delta_time / 1000000) // convert microseconds into seconds
	}
	else // subtract the time between frames
	{
		currTime -= (delta_time / 1000000) // convert microseconds into seconds
		displayedTime = ceil(currTime); // round up to nearest int
	}
}

if (displayedTime == 15)
{
	isLastFewSeconds = true;
}
