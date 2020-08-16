if instance_exists(obj_player) then
	{
	if point_distance(x, y, obj_player.x, obj_player.y) < 6000 then
		{
		if !activated then
			{
			instance_activate_region(x - 1999, y - 1999, 3998, 3998, true);
			activated = true;
			}
		}
	else
		{
		if activated then
			{
			instance_deactivate_region(x - 1999, y - 1999, 3998, 3998, true, true);
			activated = false;
			}
		}
	}
	
visible = true;
depth = -y - 10;