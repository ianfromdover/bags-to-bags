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

msg = "CASH   " + global.cash + line
	+ line
	+ "TIPS   " + global.tEarned + line // bonus time money
	+ "SALARY " + global.tEarned + line
	+ "FUEL  -100\n"
	+ "FINE   0\n"
	+ "BONUS  0 (catch criminal)\n"
	+ "--------" + line
	+ "CASH   " + global.cash + line
	+ "TOTAL  -100"
	+ "--------" + line;

draw_text(x, y, msg);