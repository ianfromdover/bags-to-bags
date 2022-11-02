if (lastFewSeconds)
{
	sprite_idx = 1;
}
else
{
	sprite_idx = 0;
}

draw_sprite_stretched(sTimerBar, sprite_idx, bar_x, bar_y, 
min(bar_width, (curr_time / max_time) * bar_width), bar_height);