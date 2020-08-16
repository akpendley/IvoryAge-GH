if active then
	{
	if instance_exists(owner) then
		{
		if owner.sign_type != other.type then
			{
			// Unset tattoo
			with owner {skeleton_attachment_set("tattoo", "no tattoo");}
			switch(owner.sign_type)
				{
				case -1:
					{
					break;
					}
				case 0:
					{
					owner.strength_boost = 1;
					break;
					}
				case 1:
					{
					owner.run_boost = 1;
					break;
					}
				case 2:
					{
					owner.max_hp -= 5;
					break;
					}
				case 3:
					{
					owner.int_boost = 1;
					break;
					}
				}
			owner.sign_type = other.type;
			switch(other.type)
				{
				case 0:
					{
					// Set tattoo slot
					with owner {skeleton_attachment_set("tattoo", "fire tattoo")}
					owner.strength_boost = 1.2;
					break;
					}
				case 1:
					{
					// Set tattoo slot
					with owner {skeleton_attachment_set("tattoo", "air tattoo")}
					owner.run_boost = 1.2;
					break;
					}
				case 2:
					{
					// Set tattoo slot
					with owner {skeleton_attachment_set("tattoo", "earth tattoo")}
					owner.max_hp += 5;
					owner.hp += 5;
					break;
					}
				case 3:
					{
					// Set tattoo slot
					with owner {skeleton_attachment_set("tattoo", "water tattoo")}
					owner.int_boost = 2;
					break;
					}
				}
			}

		}
	}