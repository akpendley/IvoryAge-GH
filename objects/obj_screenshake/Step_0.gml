if view_target = noone or !instance_exists(view_target) then
	{
	instance_destroy();
	}
else
	{
	view_target_x = view_target.x;
	view_target_y = view_target.y;
	}
if shake then
	{
	var ran_x = random_range(-15, 15);
	var ran_y = random_range(-15, 15);
	xoff += ran_x;
	yoff += ran_y;
	xoff = clamp(xoff, -25, 25);
	yoff = clamp(yoff, -25, 25);
	camera_set_view_pos(view_camera[0], view_target_x + xoff + res_x_off, view_target_y + yoff + res_y_off);
	}