function EndTripManager() constructor
{
    // room is current room variable
	// global.cash;
	// global.dayTimeLeft;
	
	static Init = function()
	{
		// okai
	}
}

function OnPlayerSleep()
{
	global.day++;
	room_goto(StartOfDay);
}
