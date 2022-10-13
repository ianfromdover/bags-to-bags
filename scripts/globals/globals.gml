/// @description All of the global variables

// Managers
global.tripManager = 0; // set at each room
// global.endTripManager = new EndTripManager();
// global.pickupManager = new PickupManager();
global.activeTimer = 0;

// on Init of the game
global.cash = 0;		// int
global.day = 1;         // int, [1, 2, 3]
global.dayTimeLeft = 300; // float, secs

// trip temp variables to send between rooms
global.tripTimeLeft = 0;
global.tEarned = 0;

// easy, mid, hard room value settings
    // timing in seconds
global.easyTime = 30;
global.midTime = 45;
global.hardTime = 60;

    // cash multipliers
global.easy_multiplier = 1;
global.mid_multiplier = 2;
global.hard_multiplier = 3;
