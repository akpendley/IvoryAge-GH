if thrown then
	{
	rotation += 10;
	mp_linear_step(xdest, ydest, range / 30, false);
	}
	
if moving then
	{
	mp_linear_step(xdest, ydest, point_distance(x, y, xdest, ydest) / 5, false);
	}