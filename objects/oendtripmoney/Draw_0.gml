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

line = "\n";

bonusZeroMsg = global.tripBagsIncomplete != 0
	? line + "You weren't given time bonus" + line
		+ "because you didn't finish" + line
	    + "sorting all the items." + line
        + line
	: "";

reportIllegMsg = global.reportedIllegal // didn't manage to implement, not enough illegal item art
	? line + "You reported an illegal item! The space police " + line
	    + "thanks you for taking a stand against trafficking." + line
	: "";
		
stealMsg = stole && !global.caught && !global.reportedIllegal
	? line + "You managed to sneakily sell" + line
        + "the items for a profit." + line
        + line
	    + "PROFIT     +" + string(global.profit) + line
	: "";
	
caughtMsg = stole && global.caught && !global.reportedIllegal
	? line + "You were caught by the space police for" + line
	    + "selling the items you took from the passenger." + line
        + line
	    + "FINE       -" + string(global.fine) + line
	: "";

msg = "EARNED     +" + string(global.tripEarned) + line
	+ "UNSORTED    " + string(global.tripBagsIncomplete) + line
	+ "--------------" + line
	+ "TIME LEFT   " + string(global.tripTimeLeft) + line
	+ "MULTIPLIER  " + string(global.tripMultiplier) + line
	+ bonusZeroMsg
	+ "TIME BONUS +" + string(global.timeBonus) + line
	+ "--------------" + line
	+ "BAGS TAKEN  " + string(global.tripBagsTaken) + line
	+ reportIllegMsg // only 1 will show
	+ stealMsg
	+ caughtMsg
	+ "--------------" + line
	+ "TOTAL      " + total + line
	+ "NEXT GOAL  " + string(AmountToNextGoal(global.cash));

draw_text(x, y, msg);

