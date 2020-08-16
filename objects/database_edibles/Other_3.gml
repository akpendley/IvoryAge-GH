if ds_exists(global.world_map_biome, ds_type_grid) then
	{
	ds_grid_destroy(global.world_map_biome);
	}
if ds_exists(global.world_map_color, ds_type_grid) then
	{
	ds_grid_destroy(global.world_map_color);
	}
if ds_exists(global.world_map_elevation, ds_type_grid) then
	{
	ds_grid_destroy(global.world_map_elevation);
	}
if ds_exists(global.world_map_elevation_seed, ds_type_grid) then
	{
	ds_grid_destroy(global.world_map_elevation_seed);
	}
if ds_exists(global.world_map_humidity, ds_type_grid) then
	{
	ds_grid_destroy(global.world_map_humidity);
	}
if ds_exists(global.world_map_humidity_seed, ds_type_grid) then
	{
	ds_grid_destroy(global.world_map_humidity_seed);
	}
if ds_exists(global.world_map_temperature, ds_type_grid) then
	{
	ds_grid_destroy(global.world_map_temperature);
	}
if ds_exists(global.world_map_temperature_seed, ds_type_grid) then
	{
	ds_grid_destroy(global.world_map_temperature_seed);
	}
if ds_exists(global.edibles_food_map, ds_type_map) then
	{
	ds_map_destroy(global.edibles_food_map);
	}
if ds_exists(global.edibles_stat_map, ds_type_map) then
	{
	ds_map_destroy(global.edibles_stat_map);
	}
if ds_exists(global.edibles_value_map, ds_type_map) then
	{
	ds_map_destroy(global.edibles_value_map);
	}
if ds_exists(global.spawners_map, ds_type_map) then
	{
	ds_map_destroy(global.spawners_map);
	}
if ds_exists(global.fertility_values, ds_type_map) then
	{
	ds_map_destroy(global.fertility_values);
	}
if ds_exists(global.xp_colors, ds_type_map) then
	{
	ds_map_destroy(global.xp_colors);
	}
if ds_exists(global.xp_sprites, ds_type_map) then
	{
	ds_map_destroy(global.xp_sprites);
	}
if ds_exists(global.xp_num, ds_type_map) then
	{
	ds_map_destroy(global.xp_num);
	}