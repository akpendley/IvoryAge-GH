draw_sprite_ext(Shadow, 0, x-30, y, 4, 4, 0, c_white, 1);
draw_self();
if tusk_count > 0 then
	{
	var tusk_yoff = 100;
	for (var i = tusk_count; i > 0; i--)
		{
			draw_sprite(Tusk, 0, x, y + tusk_yoff - (i * 100));
		}
	//draw_text(x, y, tusk_count);
	}
//draw_text(x, y, population);