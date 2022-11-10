// game window = canvas element
// display = browser window
/*
// this is less resource intensive but scaling doesn't work otherwise
if (browser_width != width || browser_height != height) // browser w changed
{
    width = min(base_width, browser_width);
    height = min(base_height, browser_height);
    ScaleCanvas(base_width, base_height, width, height, true);
}
*/

width = min(base_width, browser_width);
height = min(base_height, browser_height);
ScaleCanvas(base_width, base_height, width, height, true);
