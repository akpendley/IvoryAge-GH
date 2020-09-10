switch(itemtype)
	{
	case "mammoth tusk":
		{
		if owner = -1 and count = 0 then
			{
			other.tusk_count += 1;
			other.alarm[0] = 1;
			instance_destroy();
			}
		}
	case "snake skin":
		{
		add_stat(1, 3);
		break;
		}
	case "snake fang":
		{
		add_stat(2, 4);
		break;
		}
	case "edible":
		{
		if itemid = "meat" and owner = -1 and count = 0 then
			{
			with(other)
				{
				for(var i = 1; i <= 7; i++)
					{
					stats_map[? i] += 1;
					scr_level_up(i);
					}
				}
			instance_destroy();
			}
		}
	}