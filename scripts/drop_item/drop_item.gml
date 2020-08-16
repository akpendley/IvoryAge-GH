/// @function drop_item(itemtype, itemid, quantity);
/// @param {string} itemtype
/// @param {string} itemid
/// @param {real} quantity
/// @param {real} chance 

i_type = argument0;
i_id = argument1;
num = argument2;
chance = argument3;

repeat(num)
	{
	if irandom_range(1, 100) <= chance then
		{
		var ii = instance_create_depth(x + irandom_range(-128, 128), y + irandom_range(-128, 128), depth, item);
		ii.itemtype = i_type;
		ii.itemid = i_id;
		}
	}