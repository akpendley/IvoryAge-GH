/// @description Ready to attack
if attack_type = 2 then
	{
	if instance_exists(target) then
		{
		xdest = target.x;
		ydest = target.y;
		}
	else
		{
		xdest = x;
		ydest = y;
		}
	}
ready_to_attack = true;
show_debug_message("Ready to attack");