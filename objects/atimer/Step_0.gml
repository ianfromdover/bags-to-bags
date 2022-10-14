/// @description Countdown each second

if (timeIsRunning)
{
if (currTime < 0) // time has run out
{
	currTime = 0;
	displayedTime = 0;
	
	OnEnd();
}
else // subtract the time between frames
{
	currTime -= (delta_time / 1000000) // convert microseconds into seconds
	displayedTime = ceil(currTime); // round up to nearest int
}
}
