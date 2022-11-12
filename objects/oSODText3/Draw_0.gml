draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

msg = "It's the final day, I can't wait to meet her tomorrow." + line
	+ line
	+ "Hmm, seems like the passengers are in a bit of a rush" + line
	+ "today. They're demanding 15s less for each trip" + line
	+ "as compared to yesterday." + line
	+ line
	+ "Also, Mars is kind of far and it costs a lot to get there." + line
	+ "But I heard that it has the best views. Especially at the Mars Bar.";

draw_text(x, y, msg);