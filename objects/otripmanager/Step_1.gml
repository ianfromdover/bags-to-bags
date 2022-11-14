var max_fingers = 4; // number of fingers

// each touch is a "device"
for (var finger = 0; finger < max_fingers; finger++)
{
	// get coords
    var touch_x = device_mouse_x_to_gui(finger);
    var touch_y = device_mouse_y_to_gui(finger);
	var is_touched = device_mouse_check_button(finger, mb_left);
        
	// even if there isn't an item at pos, still run follow.
	if (global.itemBeingDragged != noone && is_touched)
	{
		global.itemBeingDragged.Follow(touch_x, touch_y);
	}
        
	// where the screen is touched, is there a flip/rotate button or an aItem? (for picking up)
    var has_touchable_at_pos = instance_position(touch_x, touch_y, ITouchable); // type: obj	
	
	// if an object is held, run the object's method OnHold
    if ((has_touchable_at_pos != noone && is_touched))
    {
		has_touchable_at_pos.OnTouch(finger, touch_x, touch_y);
    }
	
	
}

// rmb to update the copy in TMTut