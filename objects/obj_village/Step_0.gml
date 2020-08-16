/// @description Create new caveman

if instance_number(obj_player) < 1 then
	{
	// If there are no more cavemen, game over
	if population <= 0 then
		{
		// Game over screen
		room_goto(rm_gameover);
		}
	if !waiting_for_input then
		{
		waiting_for_input = true;
		alarm[2] = 30;
		}
	else
		{
		if choosing and !showing then
			{
			counter = 0;
			showing = true;
			for(var j = ds_list_size(cavemen); j < population; j++)
				{
				//Create an array of body part sprites and store it in the cavemen list, to be put into the
				//caveman_display below
				ds_list_add(cavemen, choose(spr_spine_caveman));
				}
			for(var i = 0; i < population; i++)
				{
				var ii = instance_create_depth(x + 128 * i, y + 232, -y, caveman_display);
				//Give the caveman_display all the sprites that were in the list position
				ii.sprite_index = ds_list_find_value(cavemen, i);
				}
			}
		
	
	if gamepad_button_check_pressed(0, gp_padr) or keyboard_check_pressed(ord("D")) then
		{
		if !moving then
			{
			if counter < ds_list_size(cavemen) - 1 then
				{
				moving = true;
				count = 10;
				step = 12.8;
				dir = 180;
				}
			}
		}
		
	if gamepad_button_check_pressed(0, gp_padl) or keyboard_check_pressed(ord("A")) then
		{
		if !moving then
			{
			if counter > 0 then
				{
				moving = true;
				count = 10;
				step = 12.8;
				dir = 0;
				}
			}
		}

	if moving then
		{
		count -= 1;
		if dir = 180 then
			{
			with(caveman_display)
				{
				x -= other.step;
				}
			if count < 1 then
				{
				moving = false;
				counter += 1;
				}
			}
		else if dir = 0 then
			{
			with(caveman_display)
				{
				x += other.step;
				}
			if count < 1 then
				{
				moving = false;
				counter -= 1;
				}
			}
		}	
	
	
	
	if gamepad_button_check_pressed(0, gp_face1) or keyboard_check_pressed(vk_space) then
		{
		if !moving then
			{
			choosing = false;
			instance_destroy(caveman_display);
			var ii = instance_create_depth(x + 100, y + 100, -1, obj_player);
			for(var i = 1; i <= 7; i++)
				{
				ii.start_xp_map[? i] = stats_map[? i]; //caveman starts with village xp
				ii.stats_map[? i] = ii.start_xp_map[? i];
				ii.stat_levels_map[? i] = stat_levels_map[? i];
				}
			ii.strength = strength;
			ii.max_hp = max_hp;
			ii.hp = ii.max_hp;
			ii.weapon_strength = weapon_strength;
			ii.weapon = weapon;
			ii.walkspeed = walkspeed;
			ii.sign_type = sign_type;
			population -= 1;
			//Give the new obj_player all the sprites from the cavemen list, and then delete the entry
			switch(ds_list_find_value(cavemen, counter))
				{
				case PlayerRight:
					{
					ii.left_sprite = PlayerLeft;
					ii.right_sprite = PlayerRight;
					break;
					}
				case Caveman_Right:
					{
					ii.left_sprite = Caveman_Left;
					ii.right_sprite = Caveman_Right;
					break;
					}
				case Caveman2_Right:
					{
					ii.left_sprite = Caveman2_Left;
					ii.right_sprite = Caveman2_Right;
					break;
					}
				}
			ds_list_delete(cavemen, counter);
			waiting_for_input = false;
			showing = false;
			}
		}
		}
	}