draw_set_font(RobotoMono);
draw_set_color(c_white);


// -----------------
// -- CALCULATION --
// -----------------

stole = global.tripBagsTaken > 0; // deterministic
total = (global.tripTotalAmt < 0 ? "" : "+") + string(global.tripTotalAmt);

// -------------
// -- DISPLAY --
// -------------

// use string() to turn Reals into strings.

line = "\n";
reportIllegMsg = global.reportedIllegal 
	? "You reported an illegal item! The space police " + line
	    + "thanks you for taking a stand against trafficking." + line
	: "";
		
stealMsg = stole && !global.caught && !global.reportedIllegal
	? "You managed to sneakily sell the items " + line
        + "you stole for a profit." + line
        + line
	    + "PROFIT     +" + string(global.profit) + line
	: "";
	
caughtMsg = stole && global.caught && !global.reportedIllegal
	? "While selling the items you took from the passenger, " + line
	    + "you were caught by the space police." + line
        + line
	    + "FINE       -" + string(global.fine) + line
	: "";

msg = "BASE       +" + string(global.tripBase) + line
	+ line
	+ "TIME LEFT   " + string(global.tripTimeLeft) + line
	+ "MULTIPLIER  " + string(global.tripMultiplier) + line
	+ "TIME BONUS +" + string(global.timeBonus) + line
	+ line
    + "UNSORTED    " + string(global.tripBagsIncomplete) + line
    + "PENALTY    -" + string(global.unsortedPenalty) + line
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

