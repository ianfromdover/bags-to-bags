draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

msg = "  " + string(global.midTime) + "s" + line
	+ "  $" + string(global.mid_base) + line
	+ "BONUS " + string(global.mid_multiplier) + "x";

draw_text(x, y, msg);