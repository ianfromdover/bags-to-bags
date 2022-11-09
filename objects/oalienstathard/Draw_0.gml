draw_set_font(SilomBody);
draw_set_color(#5DF542);

line = "\n";

msg = "HARD" + line
	+ "Base Fare: " + string(global.hard_base) + line
	+ "Time Bonus: " + line
	+ "$B" + string(global.hard_multiplier) + " / 1s remaining";

draw_text(x, y, msg);