// oTripManager.
// no time to standardise difficulty and use SLAP
// single level of abstraction
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
    global.difficulty = diff;
    noOfBags = numBags;

    switch (global.difficulty)
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

    // minus time taken during trip from daytime
	global.tripTimeLeft = global.activeTimer.displayedTime;
	global.dayTimeLeft = global.dayTimeLeft - GetLevelMaxTime(global.difficulty) + global.tripTimeLeft;
	
    // calculations for End Of Trip screen
    // count the number of bags
	global.reportedIllegal = false; // deterministic. assumes that puzzles that have illegal items have no valuables
    noOfBagsLoaded = global.activeTrunk.itemsContained.getSize();
    global.tripBagsTaken = global.activePersBag.itemsContained.getSize();
    global.tripBagsIncomplete = noOfBags - noOfBagsLoaded - global.tripBagsTaken;
    global.caught = global.StealChance(global.tripBagsTaken);

    // amt from no of bags * base
    tripBase = GetBase(global.difficulty);
    global.tripEarned = ceil(tripBase * (noOfBagsLoaded + global.tripBagsTaken) / noOfBags);

    // money calculation
    global.timeBonus = global.tripBagsIncomplete == 0 ? CalcMoneyFrmRemainingTime(global.tripTimeLeft, global.difficulty) : 0;

    // from stealing
    global.profit = !global.caught && !global.reportedIllegal ? global.tripBagsTaken * global.stealRewardPerBag : 0;
    global.fine = global.caught && !global.reportedIllegal ? global.tripBagsTaken * global.stealCaughtFinePerBag : 0; // positive amt

    global.tripTotalAmt = global.tripEarned + global.timeBonus + global.profit - global.fine;

    // update day statstics
    UpdateDayBonus(global.timeBonus);
    global.aliensServed++;
    global.dayTotalAmt += global.tripTotalAmt;
    global.cash += global.tripTotalAmt; // to show dist to goal in endTrip
    global.bagsCaughtStealing += (global.fine != 0) ? global.tripBagsTaken : 0;
    global.dayIncompleteBags += global.tripBagsIncomplete;
    global.dayTotalBaseAmt += global.tripEarned;
    global.dayTotalTimeBonusAmt += global.timeBonus;
    global.dayTotalStealAmt += global.profit;
    global.dayTotalFines += global.fine;

	room_goto(EndTripScene);
}

function UpdateDayBonus(bonus)
{
    switch (global.difficulty)
    {
        case "easy":
            global.bonusFromEasy += bonus;
            global.easyCompleted++;
            break;
        case "mid":
            global.bonusFromMid += bonus;
            global.midCompleted++;
            break;
        case "hard":
            global.bonusFromHard += bonus;
            global.hardCompleted++;
            break;
    };
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
            return ceil(_t * global.easy_multiplier);
            break;
        case "mid":
            global.tripMultiplier = global.mid_multiplier;
            return ceil(_t * global.mid_multiplier);
            break;
        case "hard":
            global.tripMultiplier = global.hard_multiplier;
            return ceil(_t * global.hard_multiplier);
            break;
        default:
            Log("Error: [TripManager: CalcMoneyFrmRemainingTime] invalid difficulty selected");
    };
}
