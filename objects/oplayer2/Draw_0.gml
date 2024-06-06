//begteam

draw_self();
if (rotated) {
	draw_sprite_ext(sPlayerHead,headstate,x,y-25,1,_imagey,rotation,c_white,image_alpha);
} else {
	draw_sprite_ext(sPlayerHead,headstate,x,y-25,1,1,0,c_white,image_alpha);
}