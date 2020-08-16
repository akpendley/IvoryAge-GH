/// @description Spawn Deactivators
ts.step = 8;

for(var yy = 2000; yy < global.world_size * 128; yy += 4000)
	{
	for(var xx = 2000; xx < global.world_size * 128; xx += 4000)
		{
		instance_create_depth(xx, yy, 100, deactivator_node);
		}
	}
show_debug_message(string(instance_number(deactivator_node)) + " deactivators spawned.");
show_debug_message("Ready to play.")

instance_destroy(ts);