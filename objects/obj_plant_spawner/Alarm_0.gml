if distance_to_object(obj_village) < distance then
	{
	instance_destroy();
	}
else
	{
	var ii = instance_create_depth(x, y, -y, spawn);
	ii.spawner = id;
	if spawn = item then
		{
		ii.itemtype = "edible";
		ii.itemid = choose("grass", "azalea");
		}
	}