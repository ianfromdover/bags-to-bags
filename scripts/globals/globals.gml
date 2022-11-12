/// @description All of the global variables

// -----------------------
// -- MANAGER INSTANCES --
// -----------------------

global.tripManager = noone; // set at each room
global.pickupManager = noone;
global.activeTimer = noone;

// ---------------
// -- GAME VARS --
// ---------------

global.cash = 0;		  // int
global.day = 1;           // int, [1, 2, 3]

// --------------
// -- DAY VARS --
// --------------

global.dayTimeLeft = 150; // float, secs

// cash
global.dayTotalAmt = 0;
global.dayTotalBaseAmt = 0;
global.dayTotalTimeBonusAmt = 0;
global.dayTotalStealAmt = 0;
global.dayTotalFines = 0;

// currently unused, wanted to be for balancing
global.bonusFromEasy = 0;
global.bonusFromMid = 0;
global.bonusFromHard = 0;

global.easyCompleted = 0; // no of trips
global.midCompleted = 0;
global.hardCompleted = 0;

global.bagsCaughtStealing = 0;
global.dayIncompleteBags = 0;
global.aliensServed = 0;
global.isLastTripOfDay = false;

// --------------------
// -- TRIP INSTANCES --
// --------------------

global.difficulty = "mid";
global.activePersBag = noone;
global.activeTrunk = noone;
global.itemBeingDragged = noone;

// --------------------
// -- TRIP TEMP VARS --
// --------------------

// for endtripmoney
global.tripEarned = 70; // will be overwritten by tripmanager
global.tripMultiplier = 1;
global.tripTimeLeft = 0;
global.timeBonus = 0;

global.tripBagsIncomplete = 0;
global.tripBagsTaken = 0;

global.reportedIllegal = false;
global.caught = false; 
global.profit = 0;
global.fine = 0;
global.tripTotalAmt = 0; 

// ---------------
// -- CONSTANTS --
// ---------------

global.maxDayTime = 150;

// easy, mid, hard room value settings
    // timing in seconds
global.easyTime = 60;
global.midTime = 70;
global.hardTime = 80;

global.day2TimeReduction = 20;
global.day3TimeReduction = 35;

	// cash base salary
global.easy_base = 80;
global.mid_base = 100;
global.hard_base = 120;

    // cash multipliers
global.easy_multiplier = 1;
global.mid_multiplier = 1.5;
global.hard_multiplier = 2;

    // other constants
global.stealRewardPerBag = 100;
global.stealCaughtFinePerBag = 100;
// no reward for reporting illegal goods -> just feel good about yourself

    // goal / milestone
global.goal1 = 700;
global.goal2 = 2000;
global.goal3 = 3000; // currently not used due to lack of end scenarios

global.StealChance = function(numBags)
{
    return random(1) < ((1 / 20) * numBags + 0.4);
}
/*
global.stealChance1 = 0.45;
global.stealChance2 = 0.5;
global.stealChance3 = 0.55;
global.stealChance4 = 0.6;
global.stealChance5 = 0.65;
*/

