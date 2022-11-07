/// @description Start the Game
// TODO: place this in start menu instead, once tutorial is complete.

function StartGame()
{
	ResetVarsForNewDay();
	global.day = 1;
	global.cash = 0;
	room_goto(StartOfDay1);
}

this = new UiButton(StartGame); // change room to tutorial rooms