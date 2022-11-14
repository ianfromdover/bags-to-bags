if (finger_touch_id != -1)
{
    if (device_mouse_check_button(finger_touch_id, mb_left))
    {
		// implement what you want to do with the touch
		if (!press_has_started)
		{
			this.OnClick();
			audio_play_sound(Enter, 10, 0);
			image_index = 1;
			press_has_started = true;
		}
    }
    else
    {
        finger_touch_id = -1;
        finger_touch_x = 0;
        finger_touch_y = 0;
		image_index = 0;
		press_has_started = false;
    }
}
