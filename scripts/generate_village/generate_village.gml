//Find a Forest Spot
found = false;
var total_mercy = 0;
while(!found and total_mercy <= 1000)
	{
	var xx = irandom_range(64, 192);
	var yy = irandom_range(64, 192);
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
		if global.world_map_biome[# xx, yy] = 8 or global.world_map_biome[# xx, yy] = 5 then
			{
			instance_create_depth(xx * 128, yy * 128, -yy * 128 + 1, obj_village);
			
			if !spawn_stone_sign(0, 3) then
				{
				spawn_stone_sign(0, 6);
				}
			if !spawn_stone_sign(1, 13) then
				{
				spawn_stone_sign(1, 4);
				}
			if !spawn_stone_sign(2, 8) then
				{
				spawn_stone_sign(2, 5);
				}
			if !spawn_stone_sign(3, 11) then
				{
				spawn_stone_sign(3, 10);
				}
				
			found = true;
			}
		}
	if !found then
		{
		total_mercy += 1;
		}
	}

if total_mercy = 1000 then
	{
	room_restart();
	}