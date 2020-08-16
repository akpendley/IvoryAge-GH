drop_item("snake skin", "none", 1, 75);
drop_item("snake fang", "none", 1, 25);
if instance_exists(vision_obj) then
	{
	instance_destroy(vision_obj);
	}
if instance_exists(attack_obj) then
	{
	instance_destroy(attack_obj);
	}
if instance_exists(spawner) then
	{
	spawner.alarm[0] = 300;
	}