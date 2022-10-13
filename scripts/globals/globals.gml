/// @description All of the global variables

// Managers
global.tripManager = new TripManager();
global.endTripManager = new EndTripManager();
global.pickupManager = new PickupManager();

// on Init of the game
global.cash = 0;		// int
global.day = 1;         // int, [1, 2, 3]
global.dayTimeLeft = 300; // float, secs

// easy, mid, hard room value settings
    // timing in seconds
global.easyTime = 30;
global.midTime = 45;
global.hardTime = 60;

    // cash multipliers
global.easy_multiplier = 1;
global.mid_multiplier = 2;
global.hard_multiplier = 3;
