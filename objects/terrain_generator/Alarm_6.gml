/// @description Add Animals
ts.step = 6;

generate_village();

if generate_spawner(obj_snake_spawner, 30, 300) then
	{
	show_debug_message("Generated snakes successfully.");
	}
else
	{
	show_debug_message("Unable to generate all snakes.");
	}

if generate_spawner(obj_mammoth_spawner, 100, 200) then
	{
	show_debug_message("Generated mammoths successfully.");
	}
else
	{
	show_debug_message("Unable to generate all mammoths.");
	}

alarm[7] = 10;