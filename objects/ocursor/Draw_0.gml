var mx, my;
mx = main_cam.get_mouse_x();
my = main_cam.get_mouse_y();

switch(curblock) {
	case undefined: {
		draw_sprite_ext(sCursor,curstate,x,y,1,1,0,c_white,1);
	} break;
	default: {
		draw_sprite_ext(curblock.spr,curblock.img,x,y,1,1,0,c_white,0.5);
		draw_sprite_ext(sCursor,curstate,x,y,1,1,0,c_white,0.5);
	} break;
}
draw_sprite(sMouse,round(current_time/125) mod 6, mx,my);