// oTripManager.
difficulty = "easy";
noOfBags = 5;
timerPosX = 520; // pixels
timerPosY = 145; // pixels

// global.activeTimer; // get the remaining time from this. it will call onSubmit.
global.tripManager = id;
/**
  * Related Global Vars
  * activeTrunk
  * activePersBag
  */
function Init(diff, numBags)
{
    difficulty = diff;
    noOfBags = numBags;

    switch (difficulty)
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
    };
}

function OnTripEnd()
{
	global.activeTimer.StopTimer();

    // set daytime to what it will be after the trip ends
	global.tripTimeLeft = global.activeTimer.displayedTime;
	global.dayTimeLeft = global.dayTimeLeft - GetLevelMaxTime(difficulty) + global.tripTimeLeft;
	
    // count for EOT screen
    // count the number of bags
    // TODO: make this responsive to the bags stolen in gameplay
	global.reportedIllegal = false; // deterministic. assumes that puzzles that have illegal items have no valuables
    noOfBagsLoaded = global.activeTrunk.itemsContained.getSize();
    global.tripBagsTaken = global.activePersBag.itemsContained.getSize();
    global.tripBagsIncomplete = noOfBags - noOfBagsLoaded - global.tripBagsTaken;
    global.caught = random(1) < ((1 / 20) * global.tripBagsTaken + 0.4);

    // for displayer and calc
    global.tripBase = GetBase(difficulty);

    // money calculation

    global.timeBonus = CalcMoneyFrmRemainingTime(global.tripTimeLeft, difficulty);
    global.unsortedPenalty = global.tripBagsIncomplete * global.incompleteFeePerBag;

    // from stealing
    global.profit = !global.caught && !global.reportedIllegal ? global.tripBagsTaken * global.stealRewardPerBag : 0;
    global.fine = global.caught && !global.reportedIllegal ? global.tripBagsTaken * global.stealCaughtFinePerBag : 0; // positive amt

    global.tripTotalAmt = global.tripBase + global.timeBonus + global.profit - global.unsortedPenalty - global.fine;

    // update day vars
    global.dayTotalAmt += global.tripTotalAmt;
    global.cash += global.tripTotalAmt; // to show dist to goal in endTrip

    // day vars for debug monitoring
    // global.easyCompleted++; edit by difficulty
    // bonus from this difficulty += timeBonus

    global.bagsCaughtStealing += (global.fine != 0) ? global.tripBagsTaken : 0;
    global.dayIncompleteBags += global.tripBagsIncomplete;

    if (global.isLastTripOfDay) // TODO: trigger by alien
    {
        OnDayEnd(); // in external script
    }
	
    room_goto(EndTripScene);
}

function GetBase(_diff)
{
    switch (_diff)
    {
        case "easy":
            return global.easy_base;
            break;
        case "mid":
            return global.mid_base;
            break;
        case "hard":
            return global.hard_base;
            break;
    };
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
            global.tripMultiplier = global.easy_multiplier;
            return ceil(_t) * global.easy_multiplier;
            break;
        case "mid":
            global.tripMultiplier = global.mid_multiplier;
            return ceil(_t) * global.mid_multiplier;
            break;
        case "hard":
            global.tripMultiplier = global.hard_multiplier;
            return ceil(_t) * global.hard_multiplier;
            break;
        default:
            Log("Error: [TripManager: CalcMoneyFrmRemainingTime] invalid difficulty selected");
    };
}
