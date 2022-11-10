function ScaleCanvas(base_w, base_h, curr_w, curr_h, setCenter)
{
	// bases are for the game room
    // curr is of the game canvas
    var _aspect = (base_w / base_h);

    if ((curr_w / _aspect) > curr_h)
    {
        window_set_size((curr_h *_aspect), curr_h);
    }
    else
    {
        window_set_size(curr_w, (curr_w / _aspect));
    }
    if (setCenter)
    {
        window_center();
    }

    surface_resize(application_surface, 
            min(window_get_width(), base_w), 
            min(window_get_height(), base_h));
}
