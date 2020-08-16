if instance_exists(other.owner) then
	{
	if other.owner.docile = false then
		{
		if other.owner.target = -1 or !instance_exists(other.owner.target) then
			{
			other.owner.target = id;
			other.owner.aggro = true;
			}
		}
	}