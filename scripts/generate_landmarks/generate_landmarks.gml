function generate_landmarks() {
	var found = false;

	while(!found)
		{
		var xx = irandom_range(10, global.world_size - 10);
		var yy = irandom_range(10, global.world_size - 10);

		var nowater = true;

		for(var j = -5; j < 6; j++)
			{
			for(var i = -5; i < 6; i++)
				{
				if xx + i >= 0 and xx + i <= ds_grid_width(global.world_map_biome) and yy + j >= 0 and yy + j <= ds_grid_width(global.world_map_biome) then
					{
					if global.world_map_biome[# xx + i, yy + j] < 2 then
						{
						nowater = false;
						}
					}
				}
			}
		if nowater then
			{
			instance_create_depth(xx * 128, yy * 128, 0, obj_footprint);
			show_debug_message("Generated giant footprint.")
			found = true;
			}
		}


}
