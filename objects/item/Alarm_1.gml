/// @description Put down item
valid_pickup = false;
y += 22;
count -= 1;
if count > 0 then
	{
	alarm[1] = 1;
	}
if count <= 0 then
	{
	valid_pickup = true;
	}