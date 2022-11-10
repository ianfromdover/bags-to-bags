draw_set_font(SilomBody);
draw_set_color(#5DF542);

line = "\n";

msg = "MEDIUM" + line
	+ "Base Fare: " + string(global.mid_base) + line
	+ "Time Bonus: " + line
	+ "$" + string(global.mid_multiplier) + "/s left";

draw_text(x, y, msg);