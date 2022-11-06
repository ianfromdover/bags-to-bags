draw_set_font(RobotoMono);
draw_set_color(c_black);

line = "\n";

msg = string(global.easyTime) + "s" + line
	+ "$" + string(global.easy_base) + line
	+ "BONUS " + string(global.easy_multiplier) + "x";

draw_text(x, y, msg);