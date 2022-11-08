draw_set_font(SilomTimer);


if (less15Flag)
{
	 draw_set_color(c_red);
	 sprite_idx = 1;
}
else
{
	draw_set_color(c_white);
	sprite_idx = 0;
}

draw_text(x + (bar_width / 2) - 35, y, string(displayedTime)); // 25 is letter px width
draw_sprite_stretched(sTimerBar, sprite_idx, bar_x, bar_y, 
min(bar_width, (currTime / difficultyTime) * bar_width), bar_height);

if (less15Flag)
{
	 draw_set_color(c_white);
}
else
{
	draw_set_color(c_black);
}
draw_set_font(SilomTiny);
draw_text(bar_x + barTextOffset, bar_y + barTextOffset + 1, textOnBar);