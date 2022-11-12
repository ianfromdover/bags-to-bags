// need binding in room start that's why init is there
image_speed = 0;

/// @desc resumeFunction
function resumeFunctions()
{
	global.activeTimer.ResumeTimer();
	
	var lay_id = layer_get_id("Pause");
	var bg_lay_id = layer_get_id("PauseBG");
	
	layer_set_visible(lay_id, false);
	layer_set_visible(bg_lay_id, false);
	
	instance_deactivate_layer(lay_id);
	instance_deactivate_layer(bg_lay_id);
	
}

this = new UiButton(resumeFunctions);