draw_set_font(RobotoMono);
draw_set_color(c_white);

msg = "CASH   0\n"
	+ "SALARY 0\n"
	+ "TIPS   0 (extra time)\n"
	+ "FUEL  -100\n"
	+ "FINE   0\n"
	+ "BONUS  0 (catch criminal)\n"
	+ "--------\n"
	+ "TOTAL  -100";

draw_text(x, y, msg);