draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

msg = "It's the final day, I can't wait to meet her tomorrow." + line
	+ line
	+ "Hmm, seems like the passengers are in a bit of a rush" + line
	+ "today. Maybe because the weekend is coming." + line
	+ line
	+ "Also, I heard that Mars has the best views." + line
	+ "But it's kind of far, I hope I have enough to" + line
	+ "buy fuel to get there if we can.";

draw_text(x, y, msg);