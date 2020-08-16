/// @description Generate Biome Map

global.ground_layer = layer_create(10);
global.ground_tilemap = layer_tilemap_create(global.ground_layer, 0, 0, tileset_terrain, 1024, 1024);

show_debug_message("Combining the 3 previous maps to generate biome map...");
ts.step = 3;

for(j = 0; j < ds_grid_height(global.world_map_biome); j += 1){
    for(i = 0; i < ds_grid_width(global.world_map_biome); i += 1){
        if(ds_grid_get(global.world_map_humidity,i,j) > 75 && ds_grid_get(global.world_map_temperature,i,j) > 75){
            ds_grid_set(global.world_map_biome,i,j,11); // rain forest
			tilemap_set(global.ground_tilemap, choose(1,17,17,17,17), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) > 75 && ds_grid_get(global.world_map_temperature,i,j) > 50){
            ds_grid_set(global.world_map_biome,i,j,10); // swamp
			tilemap_set(global.ground_tilemap, choose(2,18,18,18,18), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) > 50 && ds_grid_get(global.world_map_temperature,i,j) > 75){
            ds_grid_set(global.world_map_biome,i,j,9); // seasonal forest
			tilemap_set(global.ground_tilemap, choose(3,19,19,19,19), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) > 50 && ds_grid_get(global.world_map_temperature,i,j) > 50){
            ds_grid_set(global.world_map_biome,i,j,8); // forest
			tilemap_set(global.ground_tilemap, choose(4,20,20,20,20), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) > 50 && ds_grid_get(global.world_map_temperature,i,j) > 25){
            ds_grid_set(global.world_map_biome,i,j,7); // taiga
			tilemap_set(global.ground_tilemap, choose(5,21,21,21,21), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) > 25 && ds_grid_get(global.world_map_temperature,i,j) > 75){
            ds_grid_set(global.world_map_biome,i,j,6); // savanna
			tilemap_set(global.ground_tilemap, choose(6,22,22,22,22), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) > 25 && ds_grid_get(global.world_map_temperature,i,j) > 50){
            ds_grid_set(global.world_map_biome,i,j,5); // woods
			tilemap_set(global.ground_tilemap, choose(7,23,23,23,23), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) > 25 && ds_grid_get(global.world_map_temperature,i,j) > 25){
            ds_grid_set(global.world_map_biome,i,j,7); // taiga
			tilemap_set(global.ground_tilemap, choose(5,21,21,21,21), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) > 25 && ds_grid_get(global.world_map_temperature,i,j) >= 0){
            ds_grid_set(global.world_map_biome,i,j,4); // tundra
			tilemap_set(global.ground_tilemap, choose(8,24,24,24,24), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) >= 0 && ds_grid_get(global.world_map_temperature,i,j) > 25){
            ds_grid_set(global.world_map_biome,i,j,3); // desert
			tilemap_set(global.ground_tilemap, choose(9,25,25,25,25), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) >= 0 && ds_grid_get(global.world_map_temperature,i,j) > 25){
            ds_grid_set(global.world_map_biome,i,j,2); // grassy desert
			tilemap_set(global.ground_tilemap, choose(10,26,26,26,26), i, j);
        }
        else if(ds_grid_get(global.world_map_humidity,i,j) >= 0 && ds_grid_get(global.world_map_temperature,i,j) >= 0){
            ds_grid_set(global.world_map_biome,i,j,4); // tundra
			tilemap_set(global.ground_tilemap, choose(8,24,24,24,24), i, j);
        }
        
        if(ds_grid_get(global.world_map_elevation,i,j) > 85)
			{
            ds_grid_set(global.world_map_biome,i,j,12); // mountain
			tilemap_set(global.ground_tilemap, choose(11,27,27,27,27), i, j);
            if(ds_grid_get(global.world_map_elevation,i,j) > 95)
				{
                ds_grid_set(global.world_map_biome,i,j,13); // high mountain
				tilemap_set(global.ground_tilemap, choose(12,28,28,28,28), i, j);
				}
			}
        
        if(ds_grid_get(global.world_map_elevation,i,j) < 45)
			{
            ds_grid_set(global.world_map_biome,i,j,1); // shallow water
			tilemap_set(global.ground_tilemap, choose(14,30,30,30,30), i, j);
            if(ds_grid_get(global.world_map_elevation,i,j) < 40)
				{
                ds_grid_set(global.world_map_biome,i,j,0); // deep water
				tilemap_set(global.ground_tilemap, choose(13,29,29,29,29), i, j);
				}
			}
    }
}
show_debug_message("Raw biome map complete");

alarm[4] = 10;