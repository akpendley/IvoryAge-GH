global.player_id = -1;

global.done = false; // if generation is finished (misc)
global.world_size = 256;

global.world_map_humidity = ds_grid_create(global.world_size + 1, global.world_size + 1);
global.world_map_temperature = ds_grid_create(global.world_size + 1, global.world_size + 1);
global.world_map_elevation = ds_grid_create(global.world_size + 1, global.world_size + 1);

global.world_map_biome = ds_grid_create(global.world_size, global.world_size);
global.world_map_color = ds_grid_create(global.world_size, global.world_size);

ts = 0;

alarm[0] = 10;