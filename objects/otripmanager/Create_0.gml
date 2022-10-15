difficulty = "easy";
timerPosX = 75; // pixels
timerPosY = 60; // pixels

// global.activeTimer; // get the remaining time from this. it will call onSubmit.
global.tripManager = id;

switch (difficulty) // TODO: change to room's difficulty
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

function OnTripEnd()
{
	
	global.activeTimer.StopTimer();
	remainingTime = global.activeTimer.displayedTime;
	global.dayTimeLeft = global.dayTimeLeft - GetLevelMaxTime(difficulty) + remainingTime;
	
    global.cash += CalcMoneyFrmRemainingTime(remainingTime, difficulty);
    
    // store stats in global variables
    // launch the end trip room with those recents.
    room_goto(EndTripScene);
}

function GetLevelMaxTime(_diff)
{
    switch (_diff)
    {
        case "easy":
            return global.easyTime;
            break;
        case "mid":
            return global.midTime;
            break;
        case "hard":
            return global.hardTime;
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
