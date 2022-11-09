draw_set_font(SilomBody);
draw_set_color(#5DF542);

line = "\n";

msg = "MEDIUM" + line
	+ "Base Fare: " + string(global.mid_base) + line
	+ "Time Bonus: " + line
	+ "$B" + string(global.mid_multiplier) + " / 1s remaining";

/* old message
msg = string(global.midTime) + "s" + line
	+ "$" + string(global.mid_base) + line
	+ "BONUS " + string(global.mid_multiplier) + "x";
*/

draw_text(x, y, msg);