if owner != -1 and !moving then
	{
	x = owner.x + xoff;
	if !beingeaten then
		{
		y = owner.y + yoff;
		depth = owner.depth;
		}
	}
else
	{
	if !thrown then
		{
		depth = -y;
		}
	}