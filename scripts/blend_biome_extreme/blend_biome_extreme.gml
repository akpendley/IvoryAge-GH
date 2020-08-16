var dd = true;
while(dd)
	{
	var made_changes = false;
	for(var j = 0; j < ds_grid_height(global.world_map_biome); j += 1)
		{
		for(var i = 0; i < ds_grid_width(global.world_map_biome); i += 1)
			{
			var sides = 0;
			var diags = 0;
			var biome = global.world_map_biome[# i, j]; //The tile we are testing
			var neighbor_biome = 0;
			
			#region //Sides
			if global.world_map_biome[# i - 1, j] != biome then
				{
				sides += 1; //Left tile doesn't match
				}
				
			if global.world_map_biome[# i + 1, j] != biome then
				{
				sides += 1; //Right tile doesn't match
				}
				
			if global.world_map_biome[# i, j - 1] != biome then
				{
				sides += 1; //Up tile doesn't match
				}
				
			if global.world_map_biome[# i, j + 1] != biome then
				{
				sides += 1; //Down tile doesn't match
				}
			#endregion
			
			#region //Diags
			if global.world_map_biome[# i - 1, j - 1] = biome then
				{
				diags += 1; //Up Left tile matches
				}
				
			if global.world_map_biome[# i - 1, j + 1] = biome then
				{
				diags += 1; //Down Left tile matches
				}
				
			if global.world_map_biome[# i + 1, j - 1] = biome then
				{
				diags += 1; //Up Right tile matches
				}
				
			if global.world_map_biome[# i + 1, j + 1] = biome then
				{
				diags += 1; //Down Right tile matches
				}
			#endregion
				
			if sides > 3 and diags > 1 then //If most of my sides are different and most of my diagonals are the same
				{
				//This biome tile is in the wrong neighborhood
				global.world_map_biome[# i, j] = global.world_map_biome[# i, j - 1];
				made_changes = true;
				}
			}
		}
	if !made_changes then
		{
		dd = false;
		}
	}