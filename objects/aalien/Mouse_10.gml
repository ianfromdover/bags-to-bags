audio_play_sound(Whistle, 10, 0);
var border;

switch (difficulty)
{
	case "easy":
		border = oBorderEasy;
		break;
	case "mid":
		border = oBorderMid;
		break;
	case "hard":
		border = oBorderHard;
		break;
};
border_id = instance_create_layer(0, 0, "Aliens", border);