/// @function correct_checkers()

var dd = true;
while(dd)
	{
	var made_changes = false;
	for(var j = 0; j < ds_grid_height(global.world_map_biome); j += 1)
		{
		for(var i = 0; i < ds_grid_width(global.world_map_biome); i += 1)
			{
			var count = 0;
			var biome = global.world_map_biome[# i, j]; //The tile we are testing
			var neighbor_biome = -1;
			for(var k = -1; k < 2; k++) //Rows
				{
				for(var l = -1; l < 2; l++) //Columns
					{
					var tt = global.world_map_biome[# (i + k), (j + l)]; //An adjacent tile
					if tt != biome then
						{
						if neighbor_biome = -1 or tt = neighbor_biome then
							{
							count += 1; //+1 for being close to another tile like me
							neighbor_biome = tt;
							}
						}
					}
				}
			if count > 4 then //If 2 or less adjacent tiles are the same as me
				{
				//This biome tile is in the wrong neighborhood
				global.world_map_biome[# i, j] = neighbor_biome;
				made_changes = true;
				}
			}
		}
	if !made_changes then
		{
		dd = false;
		}
	}