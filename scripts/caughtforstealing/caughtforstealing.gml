function CaughtForStealing(n) // number of items stolen
{
	chance = random(1.0);
	
	return n > 9
		? chance < 0.9
		: chance < ((1 / 20) * n + 0.4);
}