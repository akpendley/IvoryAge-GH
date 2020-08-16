/// @description Insert description here
// You can write your code in this editor
while(point_distance(x, y, instance_nearest(x, y, deactivator_node).x, instance_nearest(x, y, deactivator_node).y) < 3000)
	{
	instance_destroy(instance_nearest(x, y, deactivator_node));
	}