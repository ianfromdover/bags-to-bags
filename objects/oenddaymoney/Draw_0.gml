draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

msg = "CUSTOMERS SERVED:" + line
	+ "EASY            " + string(global.easyCompleted) + line
	+ "MEDIUM          " + string(global.midCompleted) + line
	+ "HARD            " + string(global.hardCompleted) + line
	+ "--------------------" + line
	+ "BASE SALARY     " + string(global.dayTotalBaseAmt) + line
	+ "TIME BONUS      " + string(global.dayTotalTimeBonusAmt) + line
	+ "STEALING        " + string(global.dayTotalStealAmt) + line
	+ "--------------------" + line
	+ "FUEL           -" + string(global.fuelCost) + line
	+ "FINES          -" + string(global.dayTotalFines) + line
	+ "--------------------" + line
	+ "TODAY'S TOTAL   " + string(global.dayTotalAmt) + line
	+ "OVERALL CASH    " + string(global.cash) + line
	+ "--------------------" + line
	+ "NEXT GOAL       " + string(AmountToNextGoal(global.cash)) + line;

draw_text(x, y, msg);