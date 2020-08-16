/// @description Eaten cycle
y += 16;
count -= 1;
if count > 0 then
	{
	alarm[3] = 1;
	}
if count <= 0 then
	{
	part_system_depth(global.dirt_particle_system, -y - 1);
	//Set the XP particle to the correct color
	var xp_color = global.xp_colors[? global.edibles_value_map[? itemid]];
	var xp_num = global.xp_num[? xp_color];
	part_type_color1(global.xp_particle, xp_color);
	part_particles_create(global.dirt_particle_system, x, y, global.xp_particle, xp_num);
	//Set the XP sprite correctly
	part_type_sprite(global.fertility_particle, global.xp_sprites[? global.edibles_stat_map[? itemid]], false, false, false);
	part_particles_create(global.dirt_particle_system, x, y, global.fertility_particle, 1);
	instance_destroy();
	}