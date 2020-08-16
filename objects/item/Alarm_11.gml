/// @description Initialize sprite index
switch(itemtype)
	{
	case "mammoth tusk":
		{
		sprite_index = Tusk;
		break;
		}
	case "snake skin":
		{
		sprite_index = Snake_Skin;
		break;
		}
	case "snake fang":
		{
		sprite_index = Snake_Fang;
		break;
		}
	case "stone":
		{
		sprite_index = Stone;
		break;
		}
	case "edible":
		{
		switch(itemid)
			{
			case "grass":
				{
				sprite_index = Flower;
				break;
				}
			case "meat":
				{
				sprite_index = Meat;
				break;
				}
			case "azalea":
				{
				sprite_index = Azalea;
				break;
				}
			}
		break;
		}
	}