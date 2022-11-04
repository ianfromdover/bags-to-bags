//draw_sprite_stretched(sProgressBar, sprite_idx, bar_x, bar_y, bar_width, 
//max(0, min(bar_height, (global.cash / global.goal3) * bar_height)));


draw_sprite_ext(sProgressBar, sprite_idx, bar_x, bar_y, 1, 
-1 * (max(0, min(bar_height, (global.cash / global.goal3) * bar_height))),
0, c_white, 1);


draw_sprite(sProgressHolder, 0, x, y);