#region //Stats
hp = 4;
damage = 1;
stun_duration = 0;
walkspeed = 5;
runspeed = 10;
vision = 180;
default_sprite = Snake;
range = 40;						//How close I need to be to attack
damage_radius = 320;			//The distance my attack hitbox reaches
lifetime = 14;					//How long my attack hitbox is active
anticipation = 30;				//How long my preparatory animation is
sprite = Snake;				//Attacking animation to use
attack_obj = obj_enemy_attack;	//The type of hitbox to spawn
attack_range = 100;
xoff = 0;
yoff = 0;
spawner = -1;
#endregion

#region //Idling
xdest = 0;
ydest = 0;
xorigin = x;
yorigin = y;
idling = true;
idlebusy = false;
done = false;
wait = false;
#endregion

#region //Attacking
attack_type = -1;
last_attack_type = -1;
attacking = false;
attacked = false;
ready_to_attack = false;
vision_obj = -1;
attack_instance = -1;
target = -1;
docile = false; //will attack on enter vision, true = will only attack based on damage or other actions
needtoreturnhome = false;
aggro = false;
min_vision = vision
max_vision = vision * 3;
#endregion

#region //Attack Types
bite_range = 30;
spit_range = 150;

bite_damage_radius = 80;
spit_damage_radius = 200;

bite_lifetime = 10;
spit_lifetime = 60;

bite_anticipation = 30;
spit_anticipation = 30;

bite_sprite = SnakeBite;
spit_sprite = MammothDashAttack;
#endregion

#region //Initialize
alarm[9] = 1;
alarm[4] = 30;
#endregion