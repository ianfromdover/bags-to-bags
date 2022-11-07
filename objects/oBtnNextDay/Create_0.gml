/// @description sends player to next SOD room from EOD
// assumes that:
// - global day counter starts at 0
// - there are only 3 days

function NextDay()
{
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
	if (global.day == 3)
	{
		/*
        if (global.cash >= global.goal3)
        {
            nextDayRoom = OutcomeBest;
        }
        */
        if (global.cash >= global.goal2)
        {
            nextDayRoom = OutcomeBest; // missing scenario goes here
        }
        if (global.cash >= global.goal1)
        {
            nextDayRoom = OutcomeBbOkay;
        }
        else
        {
            nextDayRoom = OutcomeBad;
        }
	}
	
	// -- Main --
	// sends player to corresponding room
	ResetVarsForNewDay();
	room_goto(nextDayRoom);
}

this = new UiButton(NextDay);
