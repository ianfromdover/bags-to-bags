/// @description Countdown each second

if (this.currTime < 0) // time has run out
{
	this.currTime = 0;
	this.displayedTime = 0;
	
	// trigger functions here
}
else // subtract the time between frames
{
	this.currTime -= (delta_time / 1000000) // convert microseconds into seconds
	this.displayedTime = ceil(this.currTime); // round up to nearest int
}
