/// @function add_stat(stat, amount)
/// @param {real} stat
/// @param {real} amount
var stat = argument0;
var amount = argument1;

if owner = -1 and count = 0 then
	{
	other.stats_map[? stat] += amount;
	instance_destroy();
	}