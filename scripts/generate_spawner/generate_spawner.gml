/// @function generate_spawner(spawner_obj, amount, mercy)
/// @param {real} spawner_obj
/// @param {real} amount
/// @param {real} mercy
function generate_spawner(argument0, argument1, argument2) {

	spawner_obj = argument0;
	amount = argument1;
	mercy_limit = argument2;

	var biome_array = global.spawners_map[? spawner_obj];
	var biome = 0;
	var spawn = false;
	var enough = false;
	var mercy = 0;

	while(!enough)
		{
		if instance_number(spawner_obj) > amount or mercy > mercy_limit then
			{
			enough = true;
			}
		var sx = irandom_range(0, global.world_size - 1);
		var sy = irandom_range(0, global.world_size - 1);
		spawn = false;
		biome = global.world_map_biome[# sx, sy];
	
		if biome_array[biome] then
			{
			if point_distance(sx*128, sy*128, obj_village.x, obj_village.y) > 600 then
				{
				if instance_exists(spawner_obj) then
					{
					var in = instance_nearest(sx*128, sy*128, spawner_obj);
					if point_distance(sx*128, sy*128, in.x, in.y) > 800 then
						{
						instance_create_depth(sx*128, sy*128, 0, spawner_obj);
						}
					}
				else
					{
					instance_create_depth(sx*128, sy*128, 0, spawner_obj);
					}
				}
			}
			mercy += 1;
		}
	
	if mercy > mercy_limit then
		{
		return false; //I didn't generate all the snakes
		}
	else
		{
		return true; //I did generate all the snakes
		}


}
