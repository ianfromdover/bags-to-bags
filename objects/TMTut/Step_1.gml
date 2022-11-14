var max_fingers = 4; // number of fingers

// each touch is a "device"
for (var finger = 0; finger < max_fingers; finger++)
{
	// get coords
    var touch_x = device_mouse_x_to_gui(finger);
    var touch_y = device_mouse_y_to_gui(finger);
        
	// where the screen is touched, is there a flip/rotate button or an aItem?
    var has_touchable_at_pos = instance_position(touch_x, touch_y, ITouchable); // type: obj
    
	// should i rename this to is_held || OnHold?
	var is_touched = device_mouse_check_button(finger, mb_left);
        
	// if an object is held, run the object's method OnHold
    if (has_touchable_at_pos != noone && is_touched)
    {
		has_touchable_at_pos.OnTouch(finger, touch_x, touch_y); // nextdebug
    }
}