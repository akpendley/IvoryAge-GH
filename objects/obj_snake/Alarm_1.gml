/// @description Attempting to de-aggro
if target = -1 then //still haven't found a reason to stay aggro
	{
	aggro = false;
	idling = true;
	xdest = xorigin;
	ydest = yorigin;
	idlebusy = true;
	enemy_vision_check();
	vision = min_vision;
	vision_obj.vision = vision;
	}