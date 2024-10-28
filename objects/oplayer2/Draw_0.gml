//begteam

var _col = make_color_hsv(0,0,clamp(show_tm,20,255))

draw_sprite_ext(sprite_index,image_index,x,y,imagescale,image_yscale,image_angle,c_white,1);
if (rotated) {
	draw_sprite_ext(sPlayerHead,headstate,x,y-25,1,_imagey,rotation,c_white,image_alpha);
} else {
	draw_sprite_ext(sPlayerHead,headstate,x,y-25,1,1,0,c_white,image_alpha);
}