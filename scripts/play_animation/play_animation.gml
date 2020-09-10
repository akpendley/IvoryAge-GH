///@param anim_name
function play_animation(argument0) {

	var anim_name = argument0;

	if skeleton_animation_get() != anim_name then
		{
		skeleton_animation_set(anim_name);
		}


}
