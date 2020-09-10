/// @function spawn_stone_sign(type, biome)
/// @param {real} type
/// @param {real} biome
function spawn_stone_sign(argument0, argument1) {

	var type = argument0;
	var biome = argument1;
	var found = false;
	var mercy = 0;

	var xx = irandom_range(0, global.world_size - 1);
	var yy = irandom_range(0, global.world_size - 1);
	
	while(!found and mercy < 2000)
		{
		
		while(global.world_map_biome[# xx, yy] != biome and mercy < 2000) 
			{
			var xx = irandom_range(0, global.world_size - 1);
			var yy = irandom_range(0, global.world_size - 1);
			mercy += 1;
			}

		var nowater = true;

		for(var yyy = -3; yyy < 4; yyy++)
			{
			for(var xxx = -3; xxx < 4; xxx++)
				{
				if xx + xxx >= 0 and xx + xxx < global.world_size and yy + yyy >= 0 and yy + yyy < global.world_size then
					{
					if global.world_map_biome[# xx + xxx, yy + yyy] < 2 then
						{
						nowater = false;
						}
					}
				}
			}
	
		if nowater then
			{
			if point_distance(obj_village.x, obj_village.y, xx, yy) > 600 then
				{
				var ii = instance_create_depth(xx * 128, yy * 128, 0, obj_stone_sign);
				ii.type = type;
				show_debug_message("Spawned stone sign of type " + string(type) + " in biome " + string(biome));
				found = true;
				}
			}	
	
		mercy += 1;
		
		}
	
	if mercy > 1999 and !found then
		{
		return false; //The stone sign was not created
		}
	else
		{
		return true;
		}


}
