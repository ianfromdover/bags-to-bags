function pauseFunctions()
{
	global.activeTimer.StopTimer();
	var lay_id = layer_get_id("Pause");
	layer_set_visible(lay_id, true);
}

this = new UiButton(pauseFunctions);