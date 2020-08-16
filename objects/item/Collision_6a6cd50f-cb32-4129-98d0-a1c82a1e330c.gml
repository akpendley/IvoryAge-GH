if thrown then
	{
	other.hp -= damage;
	if other.target != last_owner and !other.aggro then //If you're not already angry or angry at the guy who threw the rock
		{
		other.needtoreturnhome = false;
		other.target = last_owner;
		other.aggro = true;
		}
	instance_destroy();
	}