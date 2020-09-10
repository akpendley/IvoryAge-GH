///@function scr_level_up(stat)
///@param {real} stat
function scr_level_up(argument0) {

	stat = argument0;
	for(var j = 0; j < 1; j++)	//nakes sure we keep levelling up until we are at the proper level (no more level ups occur when running the script)
		{
		if stats_map[? stat] >= level_xp_map[? (stat_levels_map[? stat] + 1)] then
			{
			show_message("level up");
			stat_levels_map[? stat] += 1;
			switch(stat)
				{
				case 1:	//Intelligence Level Up
					{
					j -= 1;
					switch(stat_levels_map[? stat])
						{
						case 2:
							{
							weapon = "stick1";
							weapon_strength = 0.25;
							break;
							}
						case 3:
							{
							weapon = "stick2";
							weapon_strength = 0.5;
							break;
							}
						case 4:
							{
							weapon = "stick3";
							weapon_strength = 0.75;
							break;
							}
						case 5:
							{
							weapon = "club1";
							weapon_strength = 1.25;
							break;
							}
						case 6:
							{
							weapon = "club2";
							weapon_strength = 1.5;
							break;
							}
						case 7:
							{
							weapon = "club3";
							weapon_strength = 1.75;
							break;
							}
						case 8:
							{
							weapon = "spear1";
							weapon_strength = 2.5;
							break;
							}
						case 9:
							{
							weapon = "spear2";
							weapon_strength = 3;
							break;
							}
						case 10:
							{
							weapon = "spear3";
							weapon_strength = 3.5;
							break;
							}
						}
					break;
					}
				case 2:	//Strength Level Up
					{
					j -= 1;
					switch(stat_levels_map[? stat])
						{
						case 2:
							{
							strength = 1.25;
							break;
							}
						case 3:
							{
							strength = 1.5;
							break;
							}
						case 4:
							{
							strength = 1.75;
							break;
							}
						case 5:
							{
							strength = 2;
							break;
							}
						case 6:
							{
							strength = 2.25;
							break;
							}
						case 7:
							{
							strength = 2.5;
							break;
							}
						case 8:
							{
							strength = 2.75;
							break;
							}
						case 9:
							{
							strength = 3;
							break;
							}
						case 10:
							{
							strength = 3.5;
							break;
							}
						}
					break;
					}
				case 3:	//Swimming Level Up
					{
					j -= 1;
					break;
					}
				case 4: //Fertility Level Up
					{
					j -= 1;
					break;
					}
				case 5: //Dodging Level Up
					{
					j -= 1;
					break;
					}
				case 6: //Swiftness Level Up
					{
					j -= 1;
					if stat_levels_map[? stat] != 10 then
						{
						walkspeed += 1;
						}
					else
						{
						walkspeed += 3;
						}
					break;
					}
				case 7:	//Vitality Level Up
					{
					j -= 1;
					if stat_levels_map[? stat] != 10 then
						{
						max_hp += 2;
						}
					else
						{
						max_hp += 4;
						}
					break;
					}
				}
			}
		}


}
