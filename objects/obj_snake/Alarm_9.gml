/// @description Initialize spawn
xorigin = x;
yorigin = y;

vision_obj = instance_create_depth(x + 64, y + 64, 1, obj_vision);
vision_obj.owner = id;
vision_obj.vision = vision;