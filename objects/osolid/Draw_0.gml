//begteam
var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
if (canDraw) {
	if (blockArray[index] != 0) {
		var _x, _y;
		_x = blockArray[index].pos.x*BS;
		_y = blockArray[index].pos.y*BS;
		//make_color_hsv(0,0,clamp(input_amount,7,255))
		var _col = clamp(input_amount,0,238)/255
		draw_sprite_ext(mask_index,0,_x,_y,1,1,0,c_black,1);
		draw_set_color(c_white);
		draw_set_alpha(_col);
		//draw_sprite(sprite_index,image_index,_x,_y);
		if (sprite_index != -1) {
			draw_sprite(sprite_index,0,_x,_y);
		} else {
			draw_sprite(sMissingText,0,_x,_y);
		}
		draw_set_alpha(1)
		draw_sprite(sBreak,(dest*10),_x,_y);
		if debugdraw {
			draw_set_font(fnt3);
			draw_set_color(c_white);
			draw_text(_x,_y,string(input_amount));
		}
	}
}