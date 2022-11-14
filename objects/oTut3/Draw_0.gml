draw_set_font(SilomBody);
draw_set_color(c_white);
line = "\n";

msg = "Drag these 2 items into the grid." + line
	+ line
	+ "While dragging, use A and D to rotate the item and W to flip it." + line
	+ line
	+ "If the item can be placed, the squares will turn white." + line
	+ "If it can't, they will turn dark grey." + line
	+ line
	+ "Try it out! When you are ready, hit Next." + line
	+ line
	+ "Note: The pieces will stop following your finger if you drag too quickly.";
/*
known bug: if you release a piece over another one, it makes the grid square available and you can dock the piece to the grid. for fun’s sake don’t exploit it
*/

draw_text(x, y, msg);
