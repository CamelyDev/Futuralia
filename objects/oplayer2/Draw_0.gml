//begteam

var _col = make_color_hsv(0,0,clamp(show_tm,20,255))

draw_sprite_ext(sprite_index,image_index,x,y,imagescale,image_yscale,image_angle,c_white,1);
if (rotated) {
	draw_sprite_ext(sPlayerHead,headstate,x,y-25,1,_imagey,rotation,c_white,image_alpha);
} else {
	draw_sprite_ext(sPlayerHead,headstate,x,y-25,1,1,0,c_white,image_alpha);
}
draw_set_color(c_white)
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt2);
draw_set_alpha(got_stronger/256);
draw_text(x,y-27,"GOT STRONGER.");
draw_set_alpha(rebirthed/256);
draw_text(x,y-27,"REBIRTH NUMBER " + string(rebirths) + " ACTIVE.");
draw_set_alpha(1);