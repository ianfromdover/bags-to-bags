function AmountToNextGoal(curr)
{
	if (curr < global.goal1) return global.goal1 - curr;
	if (curr < global.goal2) return global.goal2 - curr;
	if (curr < global.goal3) return global.goal3 - curr;
	if (curr > global.goal3) return 0;
}