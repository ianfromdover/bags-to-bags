function Set() constructor
{
	list = new List();
	static getSize = function()
	{
	return list.getSize();
	}
	
	static add = function(e)
	{
		if (list.contains(e))
		{
			Log("already inside, not added");
		}
		else
		{
			list.add(e);
		}
	}
	
	static removeValue = function(e)
	{
		return list.removeValue(e);
	}
	
	return self;
}
