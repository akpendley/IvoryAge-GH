drop_item("mammoth tusk", "none", 1, 100);
drop_item("edible", "meat", 2, 100);
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