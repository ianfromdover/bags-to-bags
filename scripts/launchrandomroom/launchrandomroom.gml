function LaunchRandomRoom(_difficulty)
{
	switch(_difficulty)
	{
		case "easy":
			// random from room easys
			rm_no = irandom_range(1, 3); // 3 easy rooms, inclusive int rand
			switch(rm_no)
			{
				case 1:
					room_goto(rEasy1);
					break;
				case 2:
					room_goto(rEasy2);
					break;
				case 3:
					room_goto(rEasy3);
					break;
			}
			break;
			
		case "mid":
			rm_no = irandom_range(1, 4);
			switch(rm_no)
			{
				case 1:
					room_goto(rMid1);
					break;
				case 2:
					room_goto(rMid2);
					break;
				case 3:
					room_goto(rMid3);
					break;
				case 4:
					room_goto(rMid4);
					break;
			}
			break;

		case "hard":
			rm_no = irandom_range(1, 3);
			switch(rm_no)
			{
				case 1:
					room_goto(rHard1);
					break;
				case 2:
					room_goto(rHard2);
					break;
				case 3:
					room_goto(rHard3);
					break;
			}
			break;

		default:
			Log("Error: [aAlien: Create] invalid difficulty selected");
	}
}