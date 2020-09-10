/// @description Dash Attack
if attacked then
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
	mp_linear_step(xdest, ydest, dash_attack_speed, false);
	alarm[3] = 1;
	}