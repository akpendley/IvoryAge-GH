if owner != -1 && instance_exists(owner) then
	{
	x = owner.x + xoff;
	y = owner.y + yoff;
	}
else
	{
	instance_destroy();
	}