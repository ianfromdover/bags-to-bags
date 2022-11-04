/// @description sends player to next SOD room from EOD
// assumes that:
// - global day counter starts at 0
// - there are only 3 days
if (global.day == 0)
{
	nextDayRoom = StartOfDay1;
}
if (global.day == 1)
{
	nextDayRoom = StartOfDay2;
}
if (global.day == 2)
{
	nextDayRoom = StartOfDay3;
}

ResetVarsForNewDay();
this = new UiButtonOneArg(room_goto, nextDayRoom);