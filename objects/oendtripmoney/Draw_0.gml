draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

msg = "TIME   0" + line
	+ "TIPS   0" + line
	+ line
	+ "SALARY 0" + line
	+ "FUEL  -100" + line
	+ "FINE   0" + line
	+ "BONUS  0" + line
	+ "--------" + line
	+ "CASH   0" + line
	+ "TOTAL  -100" + line;

/*
msg = "TIME   " + global.tEarned + line
	+ "TIPS   " + global.tEarned + line // bonus time money
	+ "SALARY " + global.tEarned + line
	+ "FUEL  -100\n"
	+ "FINE   0\n"
	+ "BONUS  0 (catch criminal)\n"
	+ "--------" + line
	+ "CASH   " + global.cash + line
	+ "TOTAL  -100"
	+ "--------" + line;
*/

draw_text(x, y, msg);