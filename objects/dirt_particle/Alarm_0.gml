major_dir = choose(-1, 1); //left, right
sy = y; //my baseline to bounce from
magnitude = 75; //the radius the bounce takes on the first bounce
sx = x + (major_dir * magnitude);
global.bouncy_path = path_add();

var ii = 0; //path point index
repeat(18)
	{
	var xx = sx + cos(degtorad(ii)) * magnitude;
	var yy = sy + sin(degtorad(ii)) * magnitude;
	show_debug_message(string(xx) + ", " + string(yy));
	path_add_point(global.bouncy_path, xx, yy, 100);
	ii -= 10;
	}

sx += (major_dir * magnitude) * 1.5;
magnitude /= 2;
repeat(8)
	{
	var xx = sx + cos(degtorad(ii)) * magnitude;
	var yy = sy + sin(degtorad(ii)) * magnitude;
	show_debug_message(string(xx) + ", " + string(yy));
	path_add_point(global.bouncy_path, xx, yy, 100);
	ii += 20;
	}	
	
path_start(global.bouncy_path, 4, path_action_stop, false);
initialized = true;