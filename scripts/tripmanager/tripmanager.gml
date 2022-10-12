/// Manages the room where the player is sorting into the trunk, 
/// and counts the score when the player finishes.
/// Launches the End Trip room.
function TripManager(_diff, _time) constructor
{
	diff = _diff;
	// timer = Timer(_time); // object? how to pass the curr time into the submit function?
    time_remaining = 30; // float
	
	static Init = function()
	{
		// okai
	}

	static OnSubmit = function() // link this to btn using TripManager.OnSubmit
	{
        // global.cash += CalcMoneyFrmRemainingTime(timer, diff);
        global.dayTimeLeft = global.dayTimeLeft - GetLevelMaxTime(diff) + time_remaining;
        // store the money and stats in global variables
        // launch the end trip room with those recents.
	}
}

function GetLevelMaxTime(_diff)
{
	switch (_diff)
	{
		case "easy":
			return global.easyTime;
			break;
		case "mid":
			return global.easyTime;
			break;
		case "hard":
			return global.easyTime;
			break;
        default:
			Log("Error: [TripManager: CalcMoneyFrmRemainingTime] invalid difficulty selected");
	};
}
function CalcMoneyFrmRemainingTime(_t, _diff) // _t time is a float
{

	switch (_diff)
	{
		case "easy":
			return ceil(_t) * global.easy_multiplier;
			break;
		case "mid":
			return ceil(_t) * global.mid_multiplier;
			break;
		case "hard":
			return ceil(_t) * global.hard_multiplier;
			break;
        default:
			Log("Error: [TripManager: CalcMoneyFrmRemainingTime] invalid difficulty selected");
	};
}

