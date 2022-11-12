draw_set_font(RobotoMono);
draw_set_color(c_white);

line = "\n";

msg = "I feel like i'm getting the hang of this." + line
	+ line
	+ "Looks like Taxi-co also expects me to sort bags faster." + line
	+ "They're giving me 20s less for each trip today." + line
	+ line
	+ "Some of my passengers say that the theme park is" + line
	+ "not bad on the Moon. But the restaurants there" + line
	+ "suck because there's no atmosphere. Haha, 'no atmosphere'.";

draw_text(x, y, msg);