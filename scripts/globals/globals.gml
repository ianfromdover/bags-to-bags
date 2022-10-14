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

global.day = 1;         // int, [1, 2, 3]
global.dayTimeLeft = 300; // float, secs

global.cash = 0;		// int

// --------------------
// -- TRIP INSTANCES --
// --------------------

global.activePersBag = noone;
global.activeTrunk = noone;

// --------------------
// -- TRIP TEMP VARS --
// --------------------

global.tripTimeLeft = 0;
global.tEarned = 0; // refactor to earned
global.aliensServed = 0;

// ---------------
// -- CONSTANTS --
// ---------------

// easy, mid, hard room value settings
    // timing in seconds
global.easyTime = 30;
global.midTime = 45;
global.hardTime = 60;
global.dayTimeMax = 300;

	// cash base salary
global.easy_base = 30;
global.mid_base = 50;
global.hard_base = 100;

    // cash multipliers
global.easy_multiplier = 1;
global.mid_multiplier = 2;
global.hard_multiplier = 3;
