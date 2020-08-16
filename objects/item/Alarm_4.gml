/// @description Weapon cycle
if !thrown then
	{
	thrown = true;
	has_shadow = true;
	shadow_offset = 192;
	alarm[4] = 30;  //destroy this rock if i don't hit anything
	}
else
	{
	instance_destroy();
	}