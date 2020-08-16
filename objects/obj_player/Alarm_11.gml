/// @description Initialize

if gamepad_get_device_count() > 0 then
	{
	if gamepad_is_connected(0) then
		{
		//gp = show_question("Do you want to use the controller?");
		gp = true;
		gamepad_set_axis_deadzone(0, 0.1);
		}
	}
	
switch(sign_type)
	{
	case -1:
		{
		break;
		}
	case 0:
		{
		skeleton_attachment_set("tattoo", "fire tattoo");
		strength_boost = 1.2;
		break;
		}
	case 1:
		{
		skeleton_attachment_set("tattoo", "air tattoo");
		run_boost = 1.2;
		break;
		}
	case 2:
		{
		skeleton_attachment_set("tattoo", "earth tattoo");
		max_hp += 5;
		hp += 5;
		break;
		}
	case 3:
		{
		skeleton_attachment_set("tattoo", "water tattoo");
		int_boost = 2;
		break;
		}
	}