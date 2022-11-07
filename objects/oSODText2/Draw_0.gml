draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

msg = "I feel like i'm getting the hang of this." + line
	+ line
	+ "Some of my passengers say that the rides are" + line
	+ "not bad on the Moon. But the restaurants there" + line
	+ "suck because there's no atmosphere." + line
	+ line
	+ "Maybe we can get some nice snacks instead.";

draw_text(x, y, msg);