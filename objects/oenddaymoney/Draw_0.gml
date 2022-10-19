draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

// cash
// \n
// customers served
// salary
// tips
// bonus (catch criminal)
//// (red)
// fines
// fuel
// ----
// total

msg = "CASH   " + string(global.cash) + line
	+ line
	// + "TIPS   " + string(global.tripTotal) + line // bonus time money
	// + "SALARY " + string(global.tripTotal) + line
	+ "FUEL  -100\n"
	+ "FINE   0\n"
	+ "BONUS  0 (catch criminal)\n"
	+ "--------" + line
	// + "CASH   " + global.cash + line
	+ "TOTAL  -100"
	+ "--------" + line;

draw_text(x, y, msg);