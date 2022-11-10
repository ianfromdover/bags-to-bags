///@desc spawns 3 rand aliens

// no of kinds of each type of alien
easyQty = 2;
midQty = 3;
hardQty = 5;

// coords for spawning
x1 = 250;
x2 = 670;
x3 = 1100;
y1 = 410;

a1 = 68;
b1 = 268;

// Spawns aliens depending on day's difficulty
function Init()
{
    global.pickupManager = id;

	switch(global.day)
	{
		case 1:
		case 2:
            instance_create_layer(a1, b1, "UI", oAlienStatEasy);

            instance_create_layer(x1, y1, "Aliens", SpawnRandAlienEasy());
            instance_create_layer(x2, y1, "Aliens", SpawnRandAlienMid());
            instance_create_layer(x3, y1, "Aliens", SpawnRandAlienHard());
			break;
		case 3:
            // 2 medium, 1 hard
            instance_create_layer(a1, b1, "UI", oAlienStatMid);

            instance_create_layer(x1, y1, "Aliens", SpawnRandAlienMid());
            instance_create_layer(x2, y1, "Aliens", SpawnRandAlienMid());
            instance_create_layer(x3, y1, "Aliens", SpawnRandAlienHard());
			break;
	};
}

function SpawnRandAlienEasy()
{
    return SpawnRandAlien("easy");
}

function SpawnRandAlienMid()
{
    return SpawnRandAlien("mid");
}

function SpawnRandAlienHard()
{
    return SpawnRandAlien("hard");
}

// returns oAlien object
function SpawnRandAlien(diff)
{
	switch(diff)
	{
		case "easy":
			// rand alien from aliens available
			switch(irandom_range(1, easyQty))
			{
				case 1:
                    return oCow;
					break;
				case 2:
                    return oShoeColl;
					break;
			};
			break;
		case "mid":
			switch(irandom_range(1, midQty))
			{
				case 1:
                    return oIcecream;
					break;
				case 2:
                    return oMushroom;
					break;
				case 3:
                    return oMusician;
					break;
			};
			break;
		case "hard":
			switch(irandom_range(1, hardQty))
			{
				case 1:
                    return oBattery;
					break;
				case 2:
                    return oCriminal;
					break;
				case 3:
                    return oDetective;
					break;
				case 4:
                    return oLawyer;
					break;
				case 5:
                    return oRadio;
					break;
			};
			break;
	};
}
