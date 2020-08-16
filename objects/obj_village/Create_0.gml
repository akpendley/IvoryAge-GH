depth = -y;
tusk_count = 1;
population = 2;
showing = false;
waiting_for_input = false;
choosing = false;
counter = 0;
cavemen = ds_list_create();
moving = false;
layer_force_draw_depth(true, 0);

//	Stats XP
//	1	Intelligence	Head
//	2	Strength		Arms
//	3	Swimming		Chest?
//	4	Fertility		Loins
//	5	Dodging			Knees?
//	6	Swiftness		Legs
//	7	Vitality		Whole Body

stats_map = ds_map_create();
stats_map[? 1] = 0;
stats_map[? 2] = 0;
stats_map[? 3] = 0;
stats_map[? 4] = 0;
stats_map[? 5] = 0;
stats_map[? 6] = 0;
stats_map[? 7] = 0;

//	Stat Levels

stat_levels_map = ds_map_create();
stat_levels_map[? 1] = 1;
stat_levels_map[? 2] = 1;
stat_levels_map[? 3] = 1;
stat_levels_map[? 4] = 1;
stat_levels_map[? 5] = 1;
stat_levels_map[? 6] = 1;
stat_levels_map[? 7] = 1;

//	Stat XP reqs

level_xp_map = ds_map_create();
level_xp_map[? 2] = 10;
level_xp_map[? 3] = 26;
level_xp_map[? 4] = 48;
level_xp_map[? 5] = 76;
level_xp_map[? 6] = 112;
level_xp_map[? 7] = 158;
level_xp_map[? 8] = 219;
level_xp_map[? 9] = 300;
level_xp_map[? 10] = 400;

//	Current Stats
strength = 1;
weapon = "fists";
weapon_strength = 0;
max_hp = 10;
hp = max_hp;
walkspeed = 10;
food_reserves = 0;

instance_create_depth(x, y + 128, -y - 128, obj_player);

alarm[11] = 60;