draw_set_font(RobotoMono);
draw_set_color(c_white);
reportedIllegal = false;
line = "\n";

msg = "BASE        0" + line
	+ line
	+ "TIME LEFT   0" + line
	+ "MULTIPLIER  0" + line
	+ "TIME BONUS  0" + line
	+ line
	+ "BAGS TAKEN  0" + line
	+ reportedIllegal 
		? "you reported an illegal item! the space police thanks you "
		+ "for taking a stand against illegal trafficking"
		: ""
	+ line
	+ "FUEL  -100" + line
	+ "FINE   0" + line
	+ "BONUS  0" + line
	+ "--------" + line
	+ "TOTAL  -100" + line; // if not negative, add a + sign.

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