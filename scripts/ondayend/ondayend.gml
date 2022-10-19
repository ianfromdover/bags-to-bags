function OnDayEnd()
{
	timeIsRunning = false;
	// global.day++; this should happen when the player sleeps.
	room_goto(EndOfDay);
}