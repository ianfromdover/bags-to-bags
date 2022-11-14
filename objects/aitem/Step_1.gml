/// @description Multi-touch
if (finger_touch_id != -1)
{
    if (device_mouse_check_button(finger_touch_id, mb_left))
    {
		// implement what you want to do with the touch
        if (touch_start)
		{
			OnDragStart(finger_touch_x, finger_touch_y);
			touch_start = false;
		}
		else
		{
			Follow(finger_touch_x, finger_touch_y);
		}
    }
    else
    {
        finger_touch_id = -1;
        finger_touch_x = 0;
        finger_touch_y = 0;
		
		touch_start = true;
    }
}

// if this works, del left pressed, step, drag start and dragging events
