draw_set_font(RobotoMonoTimer);


if (isLastFewSeconds)
{
	 draw_set_color(c_red);
	 sprite_idx = 1;
}
else
{
	draw_set_color(c_white);
	sprite_idx = 0;
}

draw_text(x, y, "Time Left: " + string(displayedTime));
draw_sprite_stretched(sTimerBar, sprite_idx, bar_x, bar_y, 
min(bar_width, (currTime / difficultyTime) * bar_width), bar_height);

if (isLastFewSeconds)
{
	 draw_set_color(c_white);
}
else
{
	draw_set_color(c_black);
}
draw_set_font(SilomTiny);
draw_text(bar_x + 1, bar_y + 1, textOnBar);