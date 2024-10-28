//begteam
var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
if (canDraw) and (point_in_rectangle(blockArray[index].pos.x*BS,blockArray[index].pos.y*BS,_vx-64,_vy-64,_vx+_vw,_vy+_vh)) {
	if (blockArray[index] != 0) {
		var _x, _y;
		_x = blockArray[index].pos.x*BS;
		_y = blockArray[index].pos.y*BS;
		draw_sprite_ext(asset_get_index(blockArray[index].spr),blockArray[index].img,_x,_y,1,1,0,c_black,1);
		//make_color_hsv(0,0,clamp(input_amount,7,255))
		draw_sprite_ext(asset_get_index(blockArray[index].spr),blockArray[index].img,_x,_y,1,1,0,c_white,input_amount);
		draw_sprite(sBreak,(dest*10),_x,_y);
	}
}