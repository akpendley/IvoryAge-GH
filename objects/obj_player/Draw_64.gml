/// @description stats
if draw_stats {
	draw_set_font(font0);
	draw_set_color(c_black);
	draw_set_alpha(0.3);
	draw_rectangle(0, 0, view_get_wport(view_current) / 4, window_get_height(), false);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	
	draw_text(30, 30, "intelligence " + string(stats_map[? 1]));
	draw_text(30, 80, "strength " + string(stats_map[? 2]));
	draw_text(30, 130, "swimming " + string(stats_map[? 3]));
	draw_text(30, 180, "fertility " + string(stats_map[? 4]));
	draw_text(30, 230, "dodging " + string(stats_map[? 5]));
	draw_text(30, 280, "swiftness " + string(stats_map[? 6]));
	draw_text(30, 330, "vitality " + string(stats_map[? 7]));
	
	
	draw_text(30, 430, "chewiness " + string(mouth_contents_chewiness));
	draw_text(30, 480, "size " + string(mouth_contents_size));
}