for(var j = 0; j < ds_grid_height(global.world_map_biome); j += 1)
	{
    for(var i = 0; i < ds_grid_width(global.world_map_biome); i += 1)
		{
		if global.world_map_biome[# i, j] = 0 then //Deep Water
			{
			tilemap_set(global.ground_tilemap, choose(13,29,29,29,29), i, j);
			}
		if global.world_map_biome[# i, j] = 1 then //Shallow Water
			{
			tilemap_set(global.ground_tilemap, choose(14,30,30,30,30), i, j);
			}
		if global.world_map_biome[# i, j] = 2 then //Grassy Desert
			{
			tilemap_set(global.ground_tilemap, choose(10,26,26,26,26), i, j);
			}
		if global.world_map_biome[# i, j] = 3 then //Desert
			{
			tilemap_set(global.ground_tilemap, choose(9,25,25,25,25), i, j);
			}
		if global.world_map_biome[# i, j] = 4 then //Tundra
			{
			tilemap_set(global.ground_tilemap, choose(8,24,24,24,24), i, j);
			}
		if global.world_map_biome[# i, j] = 5 then //Woods
			{
			tilemap_set(global.ground_tilemap, choose(7,23,23,23,23), i, j);
			}
		if global.world_map_biome[# i, j] = 6 then //Savanna
			{
			tilemap_set(global.ground_tilemap, choose(6,22,22,22,22), i, j);
			}
		if global.world_map_biome[# i, j] = 7 then //Taiga
			{
			tilemap_set(global.ground_tilemap, choose(5,21,21,21,21), i, j);
			}
		if global.world_map_biome[# i, j] = 8 then //Forest
			{
			tilemap_set(global.ground_tilemap, choose(4,20,20,20,20), i, j);
			}
		if global.world_map_biome[# i, j] = 9 then //Seasonal Forest
			{
			tilemap_set(global.ground_tilemap, choose(3,19,19,19,19), i, j);
			}
		if global.world_map_biome[# i, j] = 10 then //Swamp
			{
			tilemap_set(global.ground_tilemap, choose(2,18,18,18,18), i, j);
			}
		if global.world_map_biome[# i, j] = 11 then //Rain Forest
			{
			tilemap_set(global.ground_tilemap, choose(1,17,17,17,17), i, j);
			}
		if global.world_map_biome[# i, j] = 12 then //Low Mountain
			{
			tilemap_set(global.ground_tilemap, choose(11,27,27,27,27), i, j);
			}
		if global.world_map_biome[# i, j] = 13 then //High Mountain
			{
			tilemap_set(global.ground_tilemap, choose(12,28,28,28,28), i, j);
			}
		}
	}
	
show_debug_message("Rendered tiles.");