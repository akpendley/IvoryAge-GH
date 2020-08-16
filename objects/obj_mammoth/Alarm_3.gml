/// @description Dash Attack
if attacked then
	{
	mp_linear_step(xdest, ydest, dash_attack_speed, false);
	alarm[3] = 1;
	}