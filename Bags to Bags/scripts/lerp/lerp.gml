// Utility function for smoothly interpolating between 2 positions
function Lerp(start, dest, currTime, duration) // start currtime at 0
{
	change = dest - start;
	currTime /= duration / 2; // value ranges from [0, 1]
	
	if (currTime < 1)
	{
		return ((change / 2) * currTime * currTime + dest);
	}
	else
	{
		return ((-change / 2) * (currTime * (currTime - 2) - 1) + dest);
	}
}

/* How to use - place in step function
var hoverPos;

if (currTime < duration)
{
	hoverPos = Lerp(start, dest, currTime, duration);
	currTime++;
}
else
{
	// swap the positions
	var tempStartPos = start;
	start = dest;
	dest = tempStartPos;
	
	currTime = 0;
}

yPos = yStartPos + hoverPos;

*/