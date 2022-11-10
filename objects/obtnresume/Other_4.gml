function resumeFunctions()
{
	global.activeTimer.ResumeTimer();
	var lay_id = layer_get_id("Pause");
	layer_set_visible(lay_id, false);
}

this = new UiButton(resumeFunctions);