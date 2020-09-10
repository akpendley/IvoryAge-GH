draw_sprite_ext(Shadow, 0, x, y, 4, 4, 0, c_white, 1);
draw_self();
draw_set_font(font0);
draw_set_color(c_lime);
draw_text(x, y-60, "Position: " + string(x) + ", " + string(y));
draw_text(x, y-30, "Destination: " + string(xdest) + ", " + string(ydest));
draw_text(x, y, distance_to_point(xdest, ydest));
draw_text(x, y + 30, "target " + string(target));
draw_text(x, y + 60, "idlebusy " + string(idlebusy));