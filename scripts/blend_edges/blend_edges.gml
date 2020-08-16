/// @function blend_edges()
biome_order = ds_list_create();
ds_list_add(biome_order, 13);
ds_list_add(biome_order, 12);
ds_list_add(biome_order, 0);
ds_list_add(biome_order, 1);
ds_list_add(biome_order, 3);
ds_list_add(biome_order, 6);
ds_list_add(biome_order, 2);
ds_list_add(biome_order, 9);
ds_list_add(biome_order, 10);
ds_list_add(biome_order, 8);
ds_list_add(biome_order, 5);
ds_list_add(biome_order, 11);
ds_list_add(biome_order, 7);
ds_list_add(biome_order, 4);

biome_tile = ds_map_create();
biome_tile[? 0] = 13; //Deep Water
biome_tile[? 1] = 14; //Shallow Water
biome_tile[? 2] = 10; //Grassy Desert
biome_tile[? 3] = 9; //Desert
biome_tile[? 4] = 8; //Tundra
biome_tile[? 5] = 7; //Woods
biome_tile[? 6] = 6; //Savanna
biome_tile[? 7] = 5; //Taiga
biome_tile[? 8] = 4; //Forest
biome_tile[? 9] = 3; //Seasonal Forest
biome_tile[? 10] = 2; //Swamp
biome_tile[? 11] = 1; //Rain Forest
biome_tile[? 12] = 11; //Low Mountain
biome_tile[? 13] = 12; //High Mountain

global.left_edge_layer = layer_create(9);
global.up_edge_layer = layer_create(8);
global.right_edge_layer = layer_create(7);
global.down_edge_layer = layer_create(6);

global.left_tilemap = layer_tilemap_create(global.left_edge_layer, 0, 0, tileset_leftedges, global.world_size, global.world_size);
global.up_tilemap = layer_tilemap_create(global.up_edge_layer, 0, 0, tileset_upedges, global.world_size, global.world_size);
global.right_tilemap = layer_tilemap_create(global.right_edge_layer, 0, 0, tileset_rightedges, global.world_size, global.world_size);
global.down_tilemap = layer_tilemap_create(global.down_edge_layer, 0, 0, tileset_downedges, global.world_size, global.world_size);

for(var j = 0; j < ds_grid_height(global.world_map_biome); j += 1)    //Y
	{
	for(var i = 0; i < ds_grid_width(global.world_map_biome); i += 1) //X
		{
		var tt = global.world_map_biome[# i, j];
		
		if i - 1 >= 0 then
			{
			var left = global.world_map_biome[# i - 1, j];
			}
		else
			{
			var left = -1;
			}
			
		if j - 1 >= 0 then
			{
			var up = global.world_map_biome[# i, j - 1];
			}
		else
			{
			var up = -1;
			}
			
		if i + 1 < ds_grid_width(global.world_map_biome) then
			{
			var right = global.world_map_biome[# i + 1, j];
			}
		else
			{
			var right = -1;
			}
			
		if j + 1 < ds_grid_width(global.world_map_biome) then
			{
			var down = global.world_map_biome[# i, j + 1];
			}
		else
			{
			var down = -1;
			}
		
		if left != tt and left != -1 then
			{
			if ds_list_find_index(biome_order, tt) < ds_list_find_index(biome_order, left) then
				{
				//The tile to my left has a higher layer value, so draw its edge on top of me
				tilemap_set(global.left_tilemap, biome_tile[? left], i, j);
				}
			}

		if up != tt and up != -1 then
			{
			if ds_list_find_index(biome_order, tt) < ds_list_find_index(biome_order, up) then
				{
				//The tile to my left has a higher layer value, so draw its edge on top of me
				tilemap_set(global.up_tilemap, biome_tile[? up], i, j);
				}
			}
			
		if right != tt and right != -1 then
			{
			if ds_list_find_index(biome_order, tt) < ds_list_find_index(biome_order, right) then
				{
				//The tile to my left has a higher layer value, so draw its edge on top of me
				tilemap_set(global.right_tilemap, biome_tile[? right], i, j);
				}
			}
			
		if down != tt and down != -1 then
			{
			if ds_list_find_index(biome_order, tt) < ds_list_find_index(biome_order, down) then
				{
				//The tile to my left has a higher layer value, so draw its edge on top of me
				tilemap_set(global.down_tilemap, biome_tile[? down], i, j);
				}
			}			
		}
	}

show_debug_message("Biome edges blended.");
	
ds_map_destroy(biome_tile);
ds_list_destroy(biome_order);