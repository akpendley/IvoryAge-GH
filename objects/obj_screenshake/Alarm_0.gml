if shake then
	{
	if instance_exists(view_target) then
		{
		camera_set_view_target(view_camera[0], view_target);
		}
	instance_destroy();
	}