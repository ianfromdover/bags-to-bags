draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

msg = "  " + string(global.hardTime) + "s" + line
	+ "  $" + string(global.hard_base) + line
	+ "BONUS " + string(global.hard_multiplier) + "x";

draw_text(x, y, msg);