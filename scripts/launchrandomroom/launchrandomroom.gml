function LaunchRandomRoom(_difficulty)
{
	switch(_difficulty)
	{
		case "easy":
			// random from room easys
			rm_no = irandom_range(1, 10); // 10 easy rooms, inclusive int rand
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
				case 4:
					room_goto(rEasy4);
					break;
				case 5:
					room_goto(rEasy5);
					break;
				case 6:
					room_goto(rEasy6);
					break;
				case 7:
					room_goto(rEasy7);
					break;
				case 8:
					room_goto(rEasy8);
					break;
				case 9:
					room_goto(rEasy9);
					break;
				case 10:
					room_goto(rEasy10);
					break;
			}
			break;
			
		case "mid":
			rm_no = irandom_range(1, 16);
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
				case 5:
					room_goto(rMid5);
					break;
				case 6:
					room_goto(rMid6);
					break;
				case 7:
					room_goto(rMid7);
					break;
				case 8:
					room_goto(rMid8);
					break;
				case 9:
					room_goto(rMid9);
					break;
				case 10:
					room_goto(rMid9V);
					break;
				case 11:
					room_goto(rMid2V);
					break;
				case 12:
					room_goto(rMid7V);
					break;
				case 13:
					room_goto(rMid10);
					break;
				case 14:
					room_goto(rMid11);
					break;
				case 15:
					room_goto(rMid12);
					break;
				case 16:
					room_goto(rMid13);
					break;
			}
			break;

		case "hard":
			rm_no = irandom_range(1, 14);
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
				case 4:
					room_goto(rHard4);
					break;
				case 5:
					room_goto(rHard5);
					break;
				case 6:
					room_goto(rHard6);
					break;
				case 7:
					room_goto(rHard7);
					break;
				case 8:
					room_goto(rHard3V);
					break;
				case 9:
					room_goto(rHard5V);
					break;
				case 10:
					room_goto(rHard7V);
					break;
				case 11:
					room_goto(rHard8);
					break;
				case 12:
					room_goto(rHard9);
					break;
				case 13:
					room_goto(rHard10);
					break;
				case 14:
					room_goto(rHard11);
					break;
			}
			break;

		default:
		// 	Log("Error: [LaunchRandomRoom] invalid difficulty selected");
	}
}
