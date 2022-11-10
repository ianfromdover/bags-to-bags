// animate the boot opening
// https://manual-en.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FAsset_Management%2FRooms%2FBackground_Layers%2Flayer_background_speed.htm
// https://forum.yoyogames.com/index.php?threads/stop-background-sprite-animation.69188/

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_speed(back_id, 0);