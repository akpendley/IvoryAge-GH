global.player_id = id;

//Camera Setup
camera_set_view_target(view_camera[0], id);
image_xscale = 1.2;
image_yscale = 1.2;
xprop = 0;
yprop = 0;
attack_cooldown = 0;
attack_max_cooldown = 20;
itemtype = "none";
facing = 0;
left_sprite = Caveman_Left;
right_sprite = Caveman_Right;
picking_something_up = false;

//	Stats XP
//	1	Intelligence	Head
//	2	Strength		Arms
//	3	Swimming		Chest
//	4	Fertility		Loins
//	5	Dodging			Knees
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

//	Starting XP Amounts
start_xp_map = ds_map_create();
start_xp_map[? 1] = 0;
start_xp_map[? 2] = 0;
start_xp_map[? 3] = 0;
start_xp_map[? 4] = 0;
start_xp_map[? 5] = 0;
start_xp_map[? 6] = 0;
start_xp_map[? 7] = 0;

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

//  Status Effects
stunned = false;
stunned_duration = 0;

//Signs
sign_type = -1;
strength_boost = 1;
run_boost = 1;
int_boost = 1;

mouth_contents_type = "none";
mouth_contents_name = "none";
mouth_contents_size = 0;
mouth_contents_size_max = 150;
mouth_chew_power = 20;
mouth_contents_chewiness = 0;

choking = false;
windpipe_choke_risk_modifier = 0.1;
windpipe_choke_factor = 0;
windpipe_coughs_to_clear = 0;

eating = false;
bite_name = "none";
draw_stats = false;
draw_context_cue = false;
context_cue = "";

hand_context_cue = ""; // E to bite, RMB to punch, R to drop
mouth_context_cue = ""; // C to chew, C to swallow when chewiness is 0
windpipe_context_cue = ""; // C to cough when choking

idle_animation = "idle";
debug_draw_bite = false;
debug_draw_chew = false;

gp = false;
instance_create_depth(x, y, 1, the_grand_activator);
alarm[11] = 1;

skeleton_attachment_set("tattoo", "no tattoo");
play_animation("idle");