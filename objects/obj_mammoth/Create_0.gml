#region //Stats
hp = 10;
damage = 8;
stun_duration = 60;
walkspeed = 3;
runspeed = 8;
dash_attack_speed = 20;
default_sprite = Mammoth;
spawner = -1;
range = 40;						//How close I need to be to attack
damage_radius = 320;			//The distance my attack hitbox reaches
lifetime = 14;					//How long my attack hitbox is active
anticipation = 30;				//How long my preparatory animation is
sprite = Mammoth;				//Attacking animation to use
attack_obj = obj_enemy_attack;	//The type of hitbox to spawn
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
vision = 300;
min_vision = vision
max_vision = vision * 3;
#endregion

#region //Attack Types
ground_pound_range = 40;
dash_attack_range = 650;
stun_slam_range = 70;

ground_pound_damage_radius = 320;
dash_attack_damage_radius = 200;
stun_slam_damage_radius = 460;

ground_pound_lifetime = 28; // 14
dash_attack_lifetime = 120; // 60
stun_slam_lifetime = 40; // 20

ground_pound_anticipation = 60; // 30
dash_attack_anticipation = 60; // 30
stun_slam_anticipation = 80; // 40

ground_pound_sprite = "ground pound";
dash_attack_sprite = "dash attack";
stun_slam_sprite = "stun slam";
#endregion

#region //Initialize
alarm[9] = 1;
alarm[4] = 30;
play_animation("idle");
#endregion