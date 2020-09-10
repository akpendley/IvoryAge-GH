/// @description Decide to return home
if !attacking then //If I'm not in the middle of an attack
	{
	if distance_to_point(xorigin, yorigin) > 3000 then //If I'm too far from my spawn point
		{
		needtoreturnhome = true;
		target = noone;
		aggro = false;
		idling = true;
		xdest = xorigin;
		ydest = yorigin;
		idlebusy = true;
		enemy_vision_check();
		vision = 1;
		vision_obj.vision = vision; //Prevents me from re-engaging the enemy until I am close to home
		show_debug_message("Im too far from my origin, I must return home");
		}
	else if needtoreturnhome then
		{
		if distance_to_point(xorigin, yorigin) < 1000 then
			{
			needtoreturnhome = false;
			enemy_vision_check();
			vision = min_vision;
			vision_obj.vision = vision;
			show_debug_message("I'm close enough to home now");
			}
		}
	}
alarm[4] = 30;