draw_set_font(SilomBody);
draw_set_color(#5DF542);

line = "\n";

msg = "EASY" + line
	+ "Base Fare: " + string(global.easy_base) + line
	+ "Time Bonus: " + line
	+ "$" + string(global.easy_multiplier) + "/s left";

draw_text(x, y, msg);