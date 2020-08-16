repeat(5)
	{
	var ii = instance_create_depth(x + irandom_range(-400, 400), y + irandom_range(-400, 400), -1, item);
	ii.itemtype = "stone";
	ii.has_shadow = true;
	}