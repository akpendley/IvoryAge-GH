if hp <= 0 then
	{
	if itemtype != "none" then //drop what you had in your hands
		{
		itemtype = "none";
		pickup_id.owner = -1;
		pickup_id.count = pickup_id.count_max;
		pickup_id.alarm[1] = 1;
		}
	obj_village.sign_type = sign_type;
	obj_village.food_reserves += food_reserves;
	var foodperlife = global.fertility_values[? stat_levels_map[? 4]];
	while(obj_village.food_reserves / foodperlife >= 1)
		{
		obj_village.food_reserves -= foodperlife;
		obj_village.population += 1;
		}
	for(var i = 1; i <= 7; i++) //Add the new XP the caveman collected to the village pools
		{
		obj_village.stats_map[? i] += stats_map[? i] - start_xp_map[? i];
		with(obj_village)
			{
			scr_level_up(i);
			}
		}
	instance_destroy();
	}
	
depth = -y;