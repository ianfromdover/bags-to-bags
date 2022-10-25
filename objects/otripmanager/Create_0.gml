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
	// OI!! MOVE ALL THE CALCULATION HERE
	global.activeTimer.StopTimer();
	global.tripTimeLeft = global.activeTimer.displayedTime;
	global.dayTimeLeft = global.dayTimeLeft - GetLevelMaxTime(difficulty) + global.tripTimeLeft;
	
    global.cash += CalcMoneyFrmRemainingTime(global.tripTimeLeft, difficulty);
    
    // TODO: make this responsive to the gameplay
	global.reportedIllegal = false; // deterministic. assumes that puzzles that have illegal items have no valuables
    noOfBagsStolen = 1; // TODO: wire this up
    global.caught = random(1) < ((1 / 20) * noOfBagsStolen + 0.4)

    // this should be done in the game scene in OnTripEnd

    global.timeBonus = global.tripTimeLeft * global.tripMultiplier;

    global.unsortedPenalty = global.tripBagsIncomplete * global.incompleteFeePerBag;

    global.profit = !global.caught && !global.reportedIllegal ? global.tripBagsTaken * global.stealRewardPerBag : 0;
    global.fine = global.caught && !global.reportedIllegal ? global.tripBagsTaken * global.stealCaughtFinePerBag : 0; // positive amt

    global.tripTotalAmt = global.tripBase + global.timeBonus + global.profit - global.unsortedPenalty - global.fine;

    // update day vars
    global.dayTotal += global.tripTotalAmt;
    // global.easyCompleted++; edit by difficulty
    // bonus from this difficulty += timeBonus
    global.bagsCaughtStealing += (global.fine != 0) ? global.tripBagsTaken : 0;
    global.dayIncompleteBags += global.tripBagsIncomplete;
    global.dayTimeLeft -= global.tripTimeLeft; // THIS IS CALLED IN THE DRAW FUNCTION

    isLastTripOfDay = false;
    if (isLastTripOfDay)
    {
        // the end button runs
        OnDayEnd();
    }
	
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
