/// @description All of the global variables

// -----------------------
// -- MANAGER INSTANCES --
// -----------------------

global.tripManager = noone; // set at each room
// problem with room-based: just need to bind the references in the Room Start event instead of the Create
// global.endTripManager = new EndTripManager();
// global.pickupManager = new PickupManager();
global.activeTimer = noone;

// ---------------
// -- GAME VARS --
// ---------------

global.cash = 0;		// int

// --------------
// -- DAY VARS --
// --------------

global.day = 1;           // int, [1, 2, 3]
global.dayTimeLeft = 300; // float, secs
global.dayTotal = 0;

global.bonusFromEasy = 0;
global.bonusFromMid = 0;
global.bonusFromHard = 0;

global.easyCompleted = 0; // no of trips
global.midCompleted = 0;
global.hardCompleted = 0;

global.bagsCaughtStealing = 0;
global.dayIncompleteBags = 0;
global.aliensServed = 0;

// --------------------
// -- TRIP INSTANCES --
// --------------------

global.difficulty = "mid";
global.activePersBag = noone;
global.activeTrunk = noone;

// --------------------
// -- TRIP TEMP VARS --
// --------------------

global.tripBase = 70;               // edited
global.tripTimeLeft = 11;
global.tripMultiplier = 1;
global.tripBagsIncomplete = 1;
global.tripBagsTaken = 1;
global.tripTotal = 0;
global.reportedIllegal = false;
global.caught = false; 
global.profit = 0;
global.fine = 0;
global.tripTotalAmt = 0; 

// ---------------
// -- CONSTANTS --
// ---------------

global.maxDayTime = 300;

// easy, mid, hard room value settings
    // timing in seconds
global.easyTime = 60;
global.midTime = 90;
global.hardTime = 120;
global.dayTimeMax = 300;

global.day2TimeReduction = 10;
global.day3TimeReduction = 15;

	// cash base salary
global.easy_base = 70;
global.mid_base = 100;
global.hard_base = 150;

    // cash multipliers
global.easy_multiplier = 1;
global.mid_multiplier = 2;
global.hard_multiplier = 3;

    // other constants
global.fuelCost = 250;
global.incompleteFeePerBag = 30;
global.stealRewardPerBag = 100;
global.stealCaughtFinePerBag = 100;
// no reward for reporting illegal goods -> just feel good about yourself

global.stealChance1 = 0.45;
global.stealChance2 = 0.5;
global.stealChance3 = 0.55;
global.stealChance4 = 0.6;
global.stealChance5 = 0.65;

