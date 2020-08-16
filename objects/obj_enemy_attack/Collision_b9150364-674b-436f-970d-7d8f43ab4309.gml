if ds_list_find_index(hits, other.id) = -1 then
	{
	ds_list_add(hits, other.id);
	other.hp -= damage;
	if stun then
		{
		other.stunned = true;
		other.stunned_duration = stun_duration;
		}
	}