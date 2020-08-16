if !instance_exists(vision_obj) then
	{
	vision_obj = instance_create_depth(x, y, -y + 1, obj_vision);
	vision_obj.vision = vision;
	vision_obj.owner = id;
	}