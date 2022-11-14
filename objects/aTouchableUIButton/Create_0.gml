/// @description Does not inherit from aUIButton
event_inherited(); // for ITouchable detection

finger_touch_id = -1;
press_has_started = false; // flag for single-trigger

OnTouch = function(touch_id, touch_x, touch_y)
{
	finger_touch_id = touch_id;
}

// abstract vars to be overwritten in room start
fn = noone;
this = new UiButton(fn);
