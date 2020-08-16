biome = 0;
spawn = false;
var enough_plants = false;
mercy = 0;

while(!enough_plants)
	{
	if instance_number(obj_rock_spawner) > 400 or mercy > 8000 then
		{
		enough_plants = true;
		}
	var sx = irandom_range(0, global.world_size - 1);
	var sy = irandom_range(0, global.world_size - 1);
	spawn = false;
	biome = global.world_map_biome[# sx, sy];
	if biome != 0 and biome != 1 then
		{
		spawn = true;
		}
	if spawn then
		{
		if instance_exists(obj_rock_spawner) then
			{
			var in = instance_nearest(sx * 128 - 64, sy * 128 - 64, obj_rock_spawner);
			if point_distance(sx * 128 - 64, sy * 128 - 64, in.x, in.y) > 128 then
				{
				var in = instance_nearest(sx * 128 - 64, sy * 128 - 64, obj_plant_spawner);
				if point_distance(sx * 128 - 64, sy * 128 - 64, in.x, in.y) > 128 then
					{
					instance_create_depth(sx * 128 - 64, sy * 128 - 64, 0, obj_rock_spawner);
					}
				}
			}
		else
			{
			var in = instance_nearest(sx * 128 - 64, sy * 128 - 64, obj_plant_spawner);
			if point_distance(sx * 128 - 64, sy * 128 - 64, in.x, in.y) > 128 then
				{
				instance_create_depth(sx * 128 - 64, sy * 128 - 64, 0, obj_rock_spawner);
				}
			}
		}
		mercy += 1;
	}
	
show_debug_message("Generated rocks.");