#region //Vision Object Protection
enemy_vision_check();
#endregion

#region //Decide to move or idle
if idling then
	{
	if idlebusy = false then
		{
		var rr = irandom_range(1,3);
		if rr = 1 then //move
			{
			done = false;
			while(done = false)
				{
				xdest = irandom_range(-300, 300) + x;
				ydest = irandom_range(-300, 300) + y;
				if point_distance(xdest, ydest, xorigin, yorigin) < 3000 then
					{
					done = true	
					}
				}
			idlebusy = true;
			}
		else			//wait
			{
			idlebusy = true;
			wait = true;
			xdest = x;
			ydest = y;
			alarm[0] = irandom_range(20, 180);
			}
		}
	
	if idlebusy = true and wait = false then
		{
			if distance_to_point(xdest, ydest) > 20 then
				{
				if !needtoreturnhome then
					{
					mp_potential_step(xdest, ydest, walkspeed, false);
					}
				else
					{
					mp_potential_step(xdest, ydest, runspeed, false); //Run home
					}
					// Find direction to home
					
					// Set image_xscale positive or negative
					
					play_animation("walk");
				}
			else
				{
				play_animation("idle");
				idlebusy = false;
				}
		}
	}
#endregion

#region //Detect targets
if target != -1 and aggro then
	{
	idling = false;
	enemy_vision_check();
	vision = max_vision;
	vision_obj.vision = vision;
	show_debug_message("Identified target");
	}
#endregion

#region //Attack choice and pursuit
if instance_exists(target) and !needtoreturnhome and !attacking then //Pursue or attack
	{
	#region //Choose a new attack
	if attack_type = -1 then
		{
		for(var j = 0; j < 1; j++) //This prevents me from stun slam twice in a row, making stun slam more dangerous
			{
			attack_type = irandom_range(1,3);
			show_debug_message("Chose attack " + string(attack_type));
			if attack_type = 3 and last_attack_type = 3 then
				{
				j -= 1;
				show_debug_message("Can't stun slam twice, choosing attack again");
				}
			}
		switch(attack_type)
			{
			case 1:
				{
				//Ground Pound
				range = ground_pound_range;
				damage_radius = ground_pound_damage_radius; 
				lifetime = ground_pound_lifetime;
				anticipation = ground_pound_anticipation;
				sprite = "ground pound";
				show_debug_message("Loaded ground pound stats");
				break;
				}
			case 2:
				{
				//Dash Attack
				range = dash_attack_range;
				damage_radius = dash_attack_damage_radius; 
				lifetime = dash_attack_lifetime;
				anticipation = dash_attack_anticipation;
				sprite = "dash attack";
				show_debug_message("Loaded dash attack stats");
				break;
				}
			case 3:
				{
				//Stun Slam
				range = stun_slam_range;
				damage_radius = stun_slam_damage_radius; 
				lifetime = stun_slam_lifetime;
				anticipation = stun_slam_anticipation;
				sprite = "stun slam";
				show_debug_message("Loaded stun slam stats");
				break;
				}
			}
		}
	#endregion
	#region //Pursue or attack
	if distance_to_object(target) > range then
		{
		mp_potential_step(target.x, target.y, runspeed, false);
		//show_debug_message("Pursuing target");
		}
	else
		{
		//Attack
		attacking = true;
		ready_to_attack = false;
		//Start anticipation
		alarm[2] = anticipation;
		play_animation(sprite);
		show_debug_message("Caught target, beginning attack");
		}
	#endregion	
	}
	
#endregion	

#region //Attack
if attacking = true then
	{
	if ready_to_attack then
		{
		if !attacked then
			{
			attack_instance = instance_create_depth(x, y, 0, attack_obj);
			show_debug_message("Created hitbox");
			if !instance_exists(obj_screenshake) then
				{
				instance_create_depth(x, y, 0, obj_screenshake);
				}
			if attack_type = 3 then
				{
				attack_instance.damage = 0;
				attack_instance.stun = true;
				attack_instance.stun_duration = stun_duration;
				}
			else
				{
				attack_instance.damage = damage;
				}
			attack_instance.damage_radius = damage_radius;
			attack_instance.lifetime = lifetime;
			attack_instance.xoff = 0;
			attack_instance.yoff = 0;
			attack_instance.owner = id;
			attacked = true;
			last_attack_type = attack_type;
			if attack_type = 2 then
				{
				alarm[3] = 1;
				}
			show_debug_message("Loaded hitbox stats");
			}
		else
			{
			if !instance_exists(attack_instance) //the attack is done, continue pursuit
				{
				attack_instance = -1;
				attack_type = -1;
				attacked = false;
				attacking = false;
				ready_to_attack = false;
				play_animation("idle");
				show_debug_message("Reset attacking sequence");
				}
			else show_debug_message("Hitbox active - attacking");
			}
		}
	}
#endregion

#region //De-aggro
if !attacking then
	{
	if instance_exists(target) then	//try to de-aggro
		{
		if target != -1 then
			{
			if distance_to_object(target) > max_vision then	//target is too far to chase, de-aggro after 5 seconds of no sight or enemy too far from spawn
				{
				target = -1;
				alarm[1] = 300;
				show_debug_message("Target ran away, attempting to de-aggro");
				}
			}
		}
	else
		{
		if target != -1 then
			{
			target = -1;
			alarm[1] = 300;
			show_debug_message("Target no longer exists, resetting target and attempting to de-aggro");
			}
		}
	}
#endregion