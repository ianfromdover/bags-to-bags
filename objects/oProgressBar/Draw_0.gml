draw_sprite(sProgressBg, 0, x + 2, y + 2);

if (global.cash > global.goal1) sprite_idx = 1;

draw_sprite_ext(sProgressBar, sprite_idx, bar_x, bar_y, 1, 
-1 * (max(0, min(bar_height, (global.cash / global.goal2) * bar_height))),
0, c_white, 1);


draw_sprite(sProgressHolder, 0, x, y);