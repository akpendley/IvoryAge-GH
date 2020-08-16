
#region //Combat Cooldowns
if attack_cooldown > 0 then
	{
	play_animation("attack");
	attack_cooldown -= 1;
	}

if stunned then
	{
	stunned_duration -= 1;
	if stunned_duration <= 0 then
		{
		stunned = false;
		}
	}
#endregion

if (mouth_contents_size > 0) {
	eating = true;
}

xprop = 0;
yprop = 0;

if !stunned and !picking_something_up then
	{
#region //Movement
	if !gp then
		{
		if keyboard_check(ord("W")) then
			{
			xprop += 0;
			yprop -= 1;
			//facing = 90;
			}
		if keyboard_check(ord("A")) then
			{
			xprop -= 1;
			yprop += 0;
			facing = 180;
			}
		if keyboard_check(ord("S")) then
			{
			xprop += 0;
			yprop += 1;
			//facing = 270;
			}
		if keyboard_check(ord("D")) then
			{
			xprop += 1;
			yprop += 0;
			facing = 0;
			}
		}
	else
		{
		xprop = gamepad_axis_value(0, gp_axislh);
		yprop = gamepad_axis_value(0, gp_axislv);
		facing = point_direction(0, 0, xprop, yprop);
		/*if facing > 90 and facing <= 270 then
			{
			skeleton_animation_set("run");
			}
		else
			{
			skeleton_animation_set("run");
			}*/
		if facing <= 45 or facing > 315 then
			{
			facing = 0;
			}
		if facing > 45 and facing <= 135 then
			{
			//facing = 90;
			}
		if facing > 135 and facing <= 225 then
			{
			facing = 180;
			}
		if facing > 225 and facing <= 315 then
			{
			//facing = 270;
			}
		}
	
	xprop *= (walkspeed * run_boost);
	yprop *= (walkspeed * run_boost);
	
	// Update animations
	if attack_cooldown <= 0 then
		{
		if xprop == 0 and yprop == 0 then
			{
			play_animation("idle");
			}
		else
			{
			if facing = 180 then
				{
				image_xscale = -1.2;
				play_animation("run");
				}
			else
				{
				if facing = 0 then
					{
					image_xscale = 1.2;
					play_animation("run");
					}
				}
			}
		}
	// Get tile at proposed position
	var xxx = tilemap_get_cell_x_at_pixel(global.ground_tilemap, x + xprop, y + yprop);
	var yyy = tilemap_get_cell_y_at_pixel(global.ground_tilemap, x + xprop, y + yprop);
	var tl = tilemap_get(global.ground_tilemap, xxx, yyy);
	if place_free(x + xprop, y + yprop) and tl != 13 and tl != 29 and tl != 14 and tl != 30 then
		{
		x += xprop;
		y += yprop;
		//mp_linear_step(x + xprop, y + yprop, walkspeed * run_boost, false);	
		}
	#endregion
	
#region //Item Interaction
	
	// chew, swallow, and cough controls
	if keyboard_check_pressed(ord("C")) {
		if (choking) {
			// cough
			windpipe_coughs_to_clear -= 1;
			play_animation("attack");
			debug_draw_bite = true;
			if (windpipe_coughs_to_clear <= 0) {
				choking = false;
				play_animation("idle");
				}
			} 
		else {
			// chew or swallow
			if (mouth_contents_size > 0) {
				if (mouth_contents_chewiness > 0) {
					// chew
					mouth_contents_chewiness = clamp(mouth_contents_chewiness - mouth_chew_power, 0, 1000);
					debug_draw_bite = true;
					alarm[8] = 20;
				}
				// swallow
				else if (mouth_chew_power > mouth_contents_size) {
					mouth_contents_size = 0;
					eating = false;
					debug_draw_chew = true;
					alarm[8] = 20;
				} else {
					mouth_contents_size -= mouth_chew_power;
					debug_draw_chew = true;
				}
			
				//parse the itemid
				var edible_stat = global.edibles_stat_map[? bite_name];
				var edible_val = global.edibles_value_map[? bite_name];
				
				if (edible_stat != undefined && edible_val != undefined) {
					if edible_stat = 1 then
						{
						edible_val *= int_boost;
						}
				
					stats_map[? edible_stat] += edible_val;
					food_reserves += global.edibles_food_map[? bite_name];
			
					part_system_depth(global.dirt_particle_system, -y - 1);
					//Set the XP particle to the correct color
					var xp_color = global.xp_colors[? global.edibles_value_map[? bite_name]];
					var xp_num = global.xp_num[? xp_color];
					part_type_color1(global.xp_particle, xp_color);
					part_particles_create(global.dirt_particle_system, x, y, global.xp_particle, xp_num);
					//Set the XP sprite correctly
					part_type_sprite(global.fertility_particle, global.xp_sprites[? global.edibles_stat_map[? bite_name]], false, false, false);
					part_particles_create(global.dirt_particle_system, x, y, global.fertility_particle, 1);
			
					//check level
					scr_level_up(edible_stat);
					}
				// check choke conditions
				var roll = windpipe_choke_risk_modifier * irandom_range(1, 100) * windpipe_choke_factor * mouth_contents_size / mouth_contents_size_max;
				if (roll > mouth_contents_size) {
					choking = true; // >:D
					windpipe_coughs_to_clear = clamp(round((irandom_range(10, 30) * mouth_contents_size / mouth_chew_power * windpipe_choke_risk_modifier)), 1, 1000);
					}
				} 
			else {
				eating = false;	
				}
			}
		}

	if keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(0, gp_face4) then
		{
		switch(itemtype)
			{
			case "none":	//if we don't have anything in our hands
				{
				pickup_id = collision_circle(x, y, 96, item, false, true);
				if pickup_id != noone && pickup_id.valid_pickup = true then	//if there is something close enough to pick up
					{
					picking_something_up = true;
					if pickup_id.itemtype = "edible" and pickup_id.itemid != "meat" and !pickup_id.has_shadow then
						{
						part_system_depth(global.dirt_particle_system, -pickup_id.bbox_bottom - 1);
						part_particles_create(global.dirt_particle_system, pickup_id.x, pickup_id.bbox_bottom, global.particle1, 8);
						}
					pickup_id.valid_pickup = false;
					pickup_id.moving = true;
					pickup_id.xdest = x + pickup_id.xoff;
					pickup_id.ydest = y + pickup_id.yoff;
					pickup_id.alarm[5] = 20;
					alarm[0] = 20;
					pickup_id.owner = id;
					itemtype = pickup_id.itemtype;
					pickup_id.has_shadow = false;
					}
				break;
				}
				
			case "edible": // let's try and eat
				{
				// get all of the bite data ready
				bite_name = pickup_id.itemid;
				var bite_size = global.bite_data[? bite_name + "_bite_size"];
				var bite_choke_factor = global.bite_data[? bite_name + "_choke_factor"];
				
				// can we fit a bite in our mouth and are we not choking
				if (pickup_id.edible_size > 0) {
					if (mouth_contents_size + bite_size <= mouth_contents_size_max) && !choking {
						if (bite_size >= pickup_id.edible_size) {
							mouth_contents_size += pickup_id.edible_size;
							pickup_id.edible_size = 0;
							// no more edible size left of edible
							itemtype = "none";
							pickup_id.alarm[2] = 1;
						} else {
							pickup_id.edible_size -= bite_size;
							mouth_contents_size += bite_size;
						}
						debug_draw_bite = true;
						alarm[8] = 30;
						// search for bite name among the mouth contents name
						if (!string_pos(bite_name, mouth_contents_name)) {
							// if we don't already see the name, add it
							if (string_length(mouth_contents_name) == 0) {
								// if the name string is empty, just set it to the bite name
								mouth_contents_name = bite_name;
							} else {
								// if we're adding to the string, add a space if necessary and append the bite name
								if (string_char_at(mouth_contents_name, string_length(mouth_contents_name) - 1) != " ") {
									mouth_contents_name += " ";
								}
								mouth_contents_name += bite_name;
							}
					
						}
				
						windpipe_choke_factor += bite_choke_factor;
					
						// check choke conditions
						var roll = windpipe_choke_risk_modifier * irandom_range(1, 100) * windpipe_choke_factor * mouth_contents_size / mouth_contents_size_max;
						if (roll > mouth_contents_size) {
							choking = true; // >:D
							windpipe_coughs_to_clear = clamp(round((irandom_range(10, 30) * mouth_contents_size / mouth_chew_power * windpipe_choke_risk_modifier)), 1, 1000);
						}
					}
				} else {
					// no more edible size left of edible
					itemtype = "none";
					pickup_id.alarm[2] = 1;
				}

				break;
				}
				
			case "stone":
				{
				var f = facing;
				if f = 90 then
					{
					f = 270;
					}
				else if f = 270 then
					{
					f = 90;
					}
				pickup_id.ydest = pickup_id.range * sin(degtorad(f)) + pickup_id.y;
				pickup_id.xdest = pickup_id.range * cos(degtorad(f)) + pickup_id.x;
				pickup_id.last_owner = id;
				pickup_id.owner = -1;
				pickup_id.alarm[4] = 1;
				itemtype = "none";
				break;
				}
			}
		}
	
	//Put object down
	if keyboard_check_pressed(ord("R")) or gamepad_button_check_pressed(0, gp_face3) 
		{
		if itemtype != "none" then
			{
			itemtype = "none";
			pickup_id.owner = -1;
			pickup_id.count = pickup_id.count_max;
			pickup_id.has_shadow = true;
			pickup_id.alarm[1] = 1;
			}
		}
	#endregion
	
#region //Hitting stuff
	if mouse_check_button_pressed(mb_right) or gamepad_button_check_pressed(0, gp_face2) then
		{
		if attack_cooldown = 0 and itemtype = "none" then
			{
			var ii = instance_create_depth(x, y, depth, obj_attack);
			ii.owner = id;
			ii.damage = strength * strength_boost + weapon_strength;
			attack_cooldown = attack_max_cooldown;
			}
		}
	#endregion
	}