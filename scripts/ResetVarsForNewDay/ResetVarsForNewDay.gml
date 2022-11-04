function ResetVarsForNewDay()
{
	global.day++;
    global.dayTimeLeft = global.maxDayTime;

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
}
