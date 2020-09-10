/// @description Snakes!
function generate_snakes() {
	biome = 0;
	spawn = false;
	var enough_snakes = false;
	mercy = 0;

	while(!enough_snakes)
		{
		if instance_number(obj_snake_spawner) > 30 or mercy > 400 then
			{
			enough_snakes = true;
			}
		var sx = irandom_range(0, global.world_size);
		var sy = irandom_range(0, global.world_size);
		spawn = false;
		biome = global.world_map_biome[# sx, sy];
		switch(biome)
			{
			case 0:
				{
				break;
				}
			case 1:
				{
				break;
				}
			case 2:
				{
				spawn = true;	
				break;
				}
			case 3:
				{
				spawn = true;	
				break;
				}
			case 4:
				{
				break;
				}
			case 5:
				{
				spawn = true;	
				break;
				}
			case 6:
				{
				spawn = true;	
				break;	
				}
			case 7:
				{
				break;
				}
			case 8:
				{
				spawn = true;	
				break;
				}
			case 9:
				{
				break;
				}
			case 10:
				{
				spawn = true;	
				break;
				}
			case 11:
				{
				spawn = true;	
				break;
				}
			case 12:
				{
				spawn = true;
				break;
				}
			case 13:
				{
				break;
				}
			}
		if spawn then
			{
			if instance_exists(obj_snake_spawner) then
				{
				var in = instance_nearest(sx*128, sy*128, obj_snake_spawner);
				if point_distance(sx*128, sy*128, in.x, in.y) > 800 then
					{
					instance_create_depth(sx*128, sy*128, 0, obj_snake_spawner);
					}
				}
			else
				{
				instance_create_depth(sx*128, sy*128, 0, obj_snake_spawner);
				}
			}
			mercy += 1;
		}
	
	if mercy > 400 then
		{
		return false; //I didn't generate all the snakes
		}
	else
		{
		return true; //I did generate all the snakes
		}


}
