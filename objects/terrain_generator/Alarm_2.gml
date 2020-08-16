/// @description Generate Elevation Map
show_debug_message("Generating acceptable elevation map...");
ts.step = 2;

global.world_map_elevation_seed = diamond_square(global.world_map_elevation, 100, 50);
water_count = 0;
acceptable_landmass = false;

while(ds_grid_get_max(global.world_map_elevation, 0, 0, global.world_size, global.world_size) < 95 or !acceptable_landmass)
	{
    global.world_map_elevation_seed = diamond_square(global.world_map_elevation, 100, 50);
	water_count = 0;
	acceptable_landmass = false;
	for(var j = 0; j < ds_grid_width(global.world_map_elevation); j++)
		{
		for(var i = 0; i < ds_grid_height(global.world_map_elevation); i++)
			{
			if global.world_map_elevation[# j, i] < 45 then
				{
				water_count += 1;
				}
			}
		}
	if water_count < (ds_grid_width(global.world_map_elevation) * ds_grid_height(global.world_map_elevation)) * 0.20 and water_count > (ds_grid_width(global.world_map_elevation) * ds_grid_height(global.world_map_elevation)) * 0.10 then
		{
		show_debug_message("Map is only " + string(water_count / (ds_grid_width(global.world_map_elevation) * ds_grid_height(global.world_map_elevation)) * 100) + "% water.");
		acceptable_landmass = true;
		}
	}
	
alarm[3] = 10;