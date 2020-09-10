///@param anim_name
function play_animation_once(argument0) {

	var anim_name = argument0;
	var previous_anim = skeleton_animation_get();

	if previous_anim != anim_name then
		{
		skeleton_animation_set(anim_name);
		var duration = skeleton_animation_get_duration(anim_name);

		// animation clear alarm
		alarm[8] = duration;
		}
	



}
