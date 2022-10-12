/// Manages the room where the player is sorting into the trunk, 
/// and counts the score when the player finishes.
/// Launches the End Trip room.
function TripManager(_rm, _timer) constructor
{
	curr_room = _rm;
	timer = _timer;
	
	static Init = function()
	{
		// okai
	}

	static OnSubmit = function() // link this to btn using TripManager.OnSubmit
	{
        // store the money and stats in global variables
        // launch the end trip room with those recents.
	}
}
