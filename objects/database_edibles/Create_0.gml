global.edibles_stat_map = ds_map_create();
global.edibles_value_map = ds_map_create();
global.spawners_map = ds_map_create();
global.edibles_food_map = ds_map_create();
global.fertility_values = ds_map_create();
global.xp_colors = ds_map_create();
global.xp_sprites = ds_map_create();
global.xp_num = ds_map_create();
global.bite_data = ds_map_create(); // "_appended"


//	Stats
//	1	Intelligence	Head
//	2	Strength		Arms
//	3	Swimming		Chest
//	4	Fertility		Loins
//	5	Dodging			Knees
//	6	Swiftness		Legs
//	7	Vitality		Whole Body

global.edibles_stat_map[? "grass"] = 4;
global.edibles_stat_map[? "azalea"] = 6;
global.edibles_stat_map[? "meat"] = 2;


//	Values
//	0.05	Low
//	0.1		Med-Low
//	0.15	Med
//	0.25	Med-Hi
//	0.5		Hi

global.edibles_value_map[? "grass"] = 0.05;
global.edibles_value_map[? "azalea"] = 0.1;
global.edibles_value_map[? "meat"] = 0.25;

//	Values
//	1		Red
//	2		Orange
//	5		Yellow
//	10		Green
//	20		Blue

global.edibles_food_map[? "grass"] = 1;
global.edibles_food_map[? "azalea"] = 2;
global.edibles_food_map[? "meat"] = 5;

//											D Water	S Water	 G Desert	Desert	Tundra	Woods	Savanna	 Taiga	Forest	S Forest  Swamp  R Forest  Mount  H Mount	 
global.spawners_map[? obj_snake_spawner] =	   [0,	   0,        1,       1,      0,      1,       1,      0,     1,        0,      1,       1,      1,      0];
global.spawners_map[? obj_mammoth_spawner] =   [0,     0,        0,       0,      1,      0,       0,      1,     0,        0,      0,       0,      0,      1];

global.fertility_values[? 1] = 50;
global.fertility_values[? 2] = 48;
global.fertility_values[? 3] = 46;
global.fertility_values[? 4] = 44;
global.fertility_values[? 5] = 42;
global.fertility_values[? 6] = 40;
global.fertility_values[? 7] = 38;
global.fertility_values[? 8] = 36;
global.fertility_values[? 9] = 34;
global.fertility_values[? 10] = 30;

global.xp_colors[? 0.05] = c_red; //red
global.xp_colors[? 0.1] = c_orange; //orange
global.xp_colors[? 0.15] = c_yellow; //yellow
global.xp_colors[? 0.25] = c_lime; //green
global.xp_colors[? 0.5] = c_aqua; //blue

global.xp_sprites[? 1] = IntelligencePart;
global.xp_sprites[? 2] = StrengthPart;
global.xp_sprites[? 4] = FertilityPart;
global.xp_sprites[? 6] = SwiftnessPart;
global.xp_sprites[? 7] = VitalityPart;

global.xp_num[? c_red] = 2;
global.xp_num[? c_orange] = 5;
global.xp_num[? c_yellow] = 10;
global.xp_num[? c_lime] = 20;
global.xp_num[? c_aqua] = 35;

global.bite_data[? "grass_bite_size"] = 10;
global.bite_data[? "grass_choke_factor"] = 0;
global.bite_data[? "azalea_bite_size"] = 25;
global.bite_data[? "azalea_choke_factor"] = 3;

global.dirt_particle_system = part_system_create();
global.particle1 = part_type_create();
part_type_sprite(global.particle1,DirtPart,0,0,0);
part_type_size(global.particle1,1,2,-0.06,0);
part_type_scale(global.particle1,1,1);
part_type_speed(global.particle1,5,10,0,0);
part_type_direction(global.particle1,45,135,0,0);
part_type_gravity(global.particle1,0.40,270);
part_type_orientation(global.particle1,0,0,0,0,1);
part_type_life(global.particle1,45,45);

global.fertility_particle = part_type_create();
part_type_sprite(global.fertility_particle,FertilityPart,0,0,0);
part_type_size(global.fertility_particle,0.5,0.5,0.03,0);
part_type_speed(global.fertility_particle,1.5,3,0,0);
part_type_direction(global.fertility_particle,45,135,0,0);
part_type_gravity(global.fertility_particle,0.10,90);
part_type_life(global.fertility_particle,45,45);
part_type_alpha3(global.fertility_particle, 1, 1, 0);

global.xp_particle = part_type_create();
part_type_sprite(global.xp_particle,XPPart,0,0,0);
part_type_size(global.xp_particle,1,1.50,-0.03,0);
part_type_color1(global.xp_particle,255);
part_type_speed(global.xp_particle,1,3,0,0);
part_type_direction(global.xp_particle,0,359,0,0);
part_type_gravity(global.xp_particle,0.10,90);
part_type_life(global.xp_particle,45,45);

//global.enemy_moves = ds_map_create();


