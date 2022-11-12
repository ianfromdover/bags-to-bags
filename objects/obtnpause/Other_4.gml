instance_deactivate_layer("Pause"); // deactivates the buttons
instance_deactivate_layer("PauseBG");

function pauseFunctions()
{
	global.activeTimer.StopTimer();
	var lay_id = layer_get_id("Pause");
	var bg_lay_id = layer_get_id("PauseBG");
	
	instance_activate_layer(lay_id);
	instance_activate_layer(bg_lay_id);
	
	layer_set_visible(lay_id, true);
	layer_set_visible(bg_lay_id, true);
	
}
this = new UiButton(pauseFunctions);