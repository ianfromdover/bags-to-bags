draw_set_font(SilomBody);
draw_set_color(c_white);
line = "\n";

msg = "Drag the items into the grid." + line
	+ line
	+ "While dragging, use A and D to rotate the item and W to flip it." + line
	+ line
	+ "If the item can be placed, the squares will turn white." + line
	+ "If it can't, they will turn dark grey." + line
	+ line
	+ "Try it out! When you are ready, hit Next." + line;

draw_text(x, y, msg);
