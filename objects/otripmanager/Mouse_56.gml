// this should still work, as there is only 1 item being dragged at one time
var hold = global.itemBeingDragged;
if (hold != noone) hold.OnDragEnd();