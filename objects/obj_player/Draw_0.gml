draw_set_color(c_white);
draw_sprite(Shadow, 0, x, y);
draw_set_alpha(1);
draw_self();

if draw_context_cue {
	draw_text(x + 50, y, context_cue);
}

if choking {
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	draw_text(x, y, "choking! press C");
}

if eating && !choking {
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(x, y, "E to bite\nC to chew");
}

if debug_draw_chew && !debug_draw_bite {
	draw_sprite_ext(spr_chew, 0, x - 5, y - 65, image_xscale, image_yscale, 0, c_white, 1);
}

if debug_draw_bite {
	draw_sprite_ext(spr_bite, 0, x, y - 60, image_xscale, image_yscale, 0, c_white, 1);
}