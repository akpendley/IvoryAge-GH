#region //Vision Check
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
			alarm[0] = irandom_range(20, 40);
			}
		}
	
	if idlebusy = true and wait = false then
		{
			if point_distance(x, y, xdest, ydest) > 20 then
				{
				// set sprite x direction
				
				if (xdest < x) then
					{
					image_xscale = 1;
					}
				else
					{
					image_xscale = -1;
					}
					
				if !needtoreturnhome then
					{
					mp_potential_step(xdest, ydest, walkspeed, false);
					}
				else
					{
					mp_potential_step(xdest, ydest, runspeed, false); //Run home
					}
				}
			else
				{
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
		attack_type = irandom_range(1,1);
		show_debug_message("Chose attack " + string(attack_type));
		switch(attack_type)
			{
			case 1:
				{
				//Bite
				range = bite_range;
				damage_radius = bite_damage_radius; 
				lifetime = bite_lifetime;
				anticipation = bite_anticipation;
				sprite = bite_sprite;
				show_debug_message("Loaded bite stats");
				break;
				}
			case 2:
				{
				//Spit
				range = spit_range;
				damage_radius = spit_damage_radius; 
				lifetime = spit_lifetime;
				anticipation = spit_anticipation;
				sprite = spit_sprite;
				show_debug_message("Loaded spit stats");
				break;
				}
			}
		}
	#endregion
	#region //Pursue or attack
	if distance_to_object(target) > range then
		{
		// set sprite x direction
				
		if (xdest < x) then
			{
			image_xscale = 1;
			}
		else
			{
			image_xscale = -1;
			}		
		mp_potential_step(target.x, target.y, runspeed, false);
		}
	else
		{
		//Attack
		attacking = true;
		//Start anticipation
		alarm[2] = anticipation;
		sprite_index = sprite;
		if attack_type = 1 then
			{
			var dir = point_direction(x, y, target.x, target.y);
			yoff = -attack_range * sin(degtorad(dir));
			xoff = attack_range * cos(degtorad(dir));
			}
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
			attack_instance.damage = damage;
			attack_instance.damage_radius = damage_radius;
			attack_instance.lifetime = lifetime;
			if attack_type = 1 then
				{
				attack_instance.xoff = xoff;
				attack_instance.yoff = yoff;
				}
			attack_instance.owner = id;
			attacked = true;
			last_attack_type = attack_type;
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
				sprite_index = default_sprite;
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