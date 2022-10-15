draw_set_font(RobotoMonoTimer);


if (isLastFewSeconds)
{
	 draw_set_color(c_red);
}
else
{
	draw_set_color(c_white);
}
draw_text(x, y, "Time Left: " + string(displayedTime));
