if active then
	{
	if instance_exists(other) then
		{
		if ds_list_find_index(hits, other.id) = -1 then
			{
			ds_list_add(hits, other.id);
			other.hp -= damage;
			if other.target != owner and !other.aggro then //If you're not already angry or angry at the guy who attacked you
				{
				other.needtoreturnhome = false;
				other.target = owner;
				other.aggro = true;
				}
			}
		}
	}