draw_set_font(SilomBody);
draw_set_color(#5DF542);

line = "\n";

msg = "HARD" + line
	+ "Base Fare: " + string(global.hard_base) + line
	+ "Time Bonus: " + line
	+ "$" + string(global.hard_multiplier) + "/s left";

draw_text(x, y, msg);