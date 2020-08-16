/// @description Generate Temperature Map
show_debug_message("Generating acceptable temperature map...");
ts.step = 1;

global.world_map_temperature_seed = diamond_square(global.world_map_temperature, 100, 50);
while(ds_grid_get_max(global.world_map_temperature, 0, 0, global.world_size, global.world_size) < 95 || ds_grid_get_min(global.world_map_temperature, 0, 0, global.world_size, global.world_size) > 15)
	{    
	global.world_map_temperature_seed = diamond_square(global.world_map_temperature, 100, 50);
	}
	
for(var j = 0; j <= global.world_size / 4; j++)
	{
	for(var i = 0; i < ds_grid_width(global.world_map_temperature); i++)
		{
		global.world_map_temperature[# i, j] = clamp(global.world_map_temperature[# i, j] + clamp(-70 + j, -70, 0), 0, 100);
		}
	}

for(var j = global.world_size / 4 * 3; j <= global.world_size; j++)
	{
	for(var i = 0; i < ds_grid_width(global.world_map_temperature); i++)
		{
		global.world_map_temperature[# i, j] = clamp(global.world_map_temperature[# i, j] + clamp(j - 130, 0, 70), 0, 100);
		}
	}

alarm[2] = 10;