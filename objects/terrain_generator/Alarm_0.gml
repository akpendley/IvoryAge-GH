/// @description Generate Humidity Map
ts = instance_create_depth(0, 0, -100, oLoadingScreen);
ts.step = 0;

show_debug_message("Generating acceptable humidity map...");

global.world_map_humidity_seed = diamond_square(global.world_map_humidity, 100, 50);
while(ds_grid_get_max(global.world_map_humidity, 0, 0, global.world_size, global.world_size) < 95 || ds_grid_get_min(global.world_map_humidity, 0, 0, global.world_size, global.world_size) > 15)
	{
    global.world_map_humidity_seed = diamond_square(global.world_map_humidity, 100, 50);
	}

alarm[1] = 10;