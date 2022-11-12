function pauseFunctions()
{
	global.activeTimer.StopTimer();
	var lay_id = layer_get_id("Pause");
	instance_activate_layer(lay_id);
	layer_set_visible(lay_id, true);
	
	var bg_lay_id = layer_get_id("PauseBG");
	instance_activate_layer(bg_lay_id);
	layer_set_visible(bg_lay_id, true);
	
}
instance_deactivate_layer("Pause");
instance_deactivate_layer("PauseBG");
this = new UiButton(pauseFunctions);