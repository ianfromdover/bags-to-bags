/// @description Countdown each second

if (thisLogic.currTime < 0) // time has run out
{
	thisLogic.currTime = 0;
	thisLogic.displayedTime = 0;
	
	// trigger functions here
}
else // subtract the time between frames
{
	thisLogic.currTime -= (delta_time / 1000000) // convert microseconds into seconds
	thisLogic.displayedTime = ceil(thisLogic.currTime); // round up to nearest int
}
