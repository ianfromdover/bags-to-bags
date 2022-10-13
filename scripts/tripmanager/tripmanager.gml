/// Manages the room where the player is sorting into the trunk, 
/// and counts the score when the player finishes.
/// Launches the End Trip room.
function TripManager() constructor
{
    // difficulty = global difficulty
    // time = global time
    timerPosX = 64; // pixels
    timerPosY = 64; // pixels

    // assign on difficulty setting
    timerObj = 0; 
    timerLogic = 0; // get the time remaining from this
	
	switch ("easy") // TODO: change to room's difficulty
	{
		case "easy":
            timerObj = instance_create_layer(timerPosX, timerPosY, "UI", oTimerEasy);
			break;
		case "mid":
            timerObj = instance_create_layer(timerPosX, timerPosY, "UI", oTimerMid);
			break;
		case "hard":
            timerObj = instance_create_layer(timerPosX, timerPosY, "UI", oTimerHard);
			break;
        default:
			Log("Error: [TripManager: Init] invalid difficulty selected");
	};
    timerLogic = timerObj.thisLogic;

	static OnSubmit = function() // link this to btn using TripManager.OnSubmit
	{
        Log("ONSUBMIT WORKS");
        // global.cash += CalcMoneyFrmRemainingTime(timer, diff);
        // global.dayTimeLeft = global.dayTimeLeft - GetLevelMaxTime(diff) + time_remaining;
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

