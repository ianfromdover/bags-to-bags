draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

// bug: concat Real to String

msg = "  " + string(global.easyTime) + "s" + line
	+ "  $" + string(global.easy_base) + line
	+ "BONUS " + string(global.easy_multiplier) + "x";

draw_text(x, y, msg);