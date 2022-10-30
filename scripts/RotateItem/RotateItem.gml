// functions to transform the item being held
function RotateItemL() // called by the UI buttons
{
	if (global.itemBeingDragged == noone) exit;
	
	global.itemBeingDragged.RotateL();
}

function RotateItemR() // called by the UI buttons
{
	if (global.itemBeingDragged == noone) exit;
	
	global.itemBeingDragged.RotateR();
}

function FlipItem() // called by the UI buttons
{
	if (global.itemBeingDragged == noone) exit;
	
	global.itemBeingDragged.FlipHrz();
}
