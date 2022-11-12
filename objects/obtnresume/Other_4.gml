function resumeFunctions()
{
	global.activeTimer.ResumeTimer();
	var lay_id = layer_get_id("Pause");
	layer_set_visible(lay_id, false);
	instance_deactivate_layer(lay_id);
	
	var bg_lay_id = layer_get_id("PauseBG");
	layer_set_visible(bg_lay_id, false);
	instance_deactivate_layer(bg_lay_id);
}

this = new UiButton(resumeFunctions);