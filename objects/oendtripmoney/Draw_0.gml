draw_set_font(RobotoMono);
draw_set_color(c_white);


// -----------------
// -- CALCULATION --
// -----------------

reportedIllegal = false; // deterministic. assumes that puzzles that have illegal items have no valuables
stole = global.tripBagsTaken > 0; // deterministic
caught = false; // eqn. false if stole is false

// this should be done in the game scene in OnTripEnd

timeBonus = global.tripTimeLeft * global.tripMultiplier;

unsortedPenalty = global.tripBagsIncomplete * global.incompleteFeePerBag;

profit = !caught && !reportedIllegal ? global.tripBagsTaken * global.stealRewardPerBag : 0;
fine = caught && !reportedIllegal ? global.tripBagsTaken * global.stealCaughtFinePerBag : 0; // positive amt

totalAmt = global.tripBase + timeBonus + profit - unsortedPenalty - fine;
total = (totalAmt < 0 ? "" : "+") + string(totalAmt);

// update day vars
global.dayTotal += totalAmt;
// global.easyCompleted++; edit by difficulty
// bonus from this difficulty += timeBonus
global.bagsCaughtStealing += (fine != 0) ? global.tripBagsTaken : 0;
global.dayIncompleteBags += global.tripBagsIncomplete;
global.dayTimeLeft -= global.tripTimeLeft;

isLastTripOfDay = false;
if (isLastTripOfDay)
{
    // the end button runs
    OnDayEnd();
}

// -------------
// -- DISPLAY --
// -------------

// use string() to turn Reals into strings.

line = "\n";
reportIllegMsg = reportedIllegal 
	? "You reported an illegal item! The space police " + line
	    + "thanks you for taking a stand against trafficking." + line
	: "";
		
stealMsg = stole && !caught && !reportedIllegal
	? "You managed to sneakily sell the items " + line
        + "you stole for a profit." + line
        + line
	    + "PROFIT     +" + string(profit) + line
	: "";
	
caughtMsg = stole && caught && !reportedIllegal
	? "While selling the items you took from the passenger, " + line
	    + "you were caught by the space police." + line
        + line
	    + "FINE       -" + string(fine) + line
	: "";

msg = "BASE       +" + string(global.tripBase) + line
	+ line
	+ "TIME LEFT   " + string(global.tripTimeLeft) + line
	+ "MULTIPLIER  " + string(global.tripMultiplier) + line
	+ "TIME BONUS +" + string(timeBonus) + line
	+ line
    + "UNSORTED    " + string(global.tripBagsIncomplete) + line
    + "PENALTY    -" + string(unsortedPenalty) + line
	+ line
	+ "BAGS TAKEN  " + string(global.tripBagsTaken) + line
	+ reportIllegMsg // only 1 will show
	+ stealMsg
	+ caughtMsg
	+ line
	+ "--------------" + line
	+ "TOTAL      " + total + line;
    // should we tell them how much $ until the next milestone?

draw_text(x, y, msg);

