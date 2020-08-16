if distance_to_object(obj_village) < distance then
	{
	instance_destroy();
	}
else
	{
	var ii = instance_create_depth(x, y, -y, spawn);
	ii.spawner = id;
	ii.itemtype = "stone";
	}