/// @function blend_biome(number_of_adjacent_tiles_needed_to_remain)
/// @param {real} number_of_adjacent_tiles_needed_to_remain
function blend_biome(argument0) {
	var q = argument0;

	var time_started = date_current_datetime();

	var dd = true;
	while(dd)
		{
		var made_changes = false;
		for(var j = 0; j < ds_grid_height(global.world_map_biome) - 1; j += 1)
			{
			for(var i = 0; i < ds_grid_width(global.world_map_biome) - 1; i += 1)
				{
				var count = 0;
				var biome = global.world_map_biome[# i, j]; //The tile we are testing
				var neighbor_biome = 0;
				for(var k = -1; k < 2; k++) //Rows
					{
					for(var l = -1; l < 2; l++) //Columns
						{
						if i + k >= 0 and i + k <= 256 and j + l >= 0 and j + l <= 256 then //Prevents index out of bounds errors for checking edge tiles
							{
							var tt = global.world_map_biome[# (i + k), (j + l)]; //An adjacent tile
							if tt = biome then
								{
								count += 1; //+1 for being close to another tile like me
								}
							else
								{
								neighbor_biome = tt;
								}
							}
						}
					}
				if count <= q then //If 2 or less adjacent tiles are the same as me
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
			show_debug_message("Blend biome pass successful.");
			}
		if date_second_span(time_started, date_current_datetime()) > 4 then
			{
			dd = false;
			show_debug_message("Blending the biome was too hard so I quit.")
			}
		}


}
