draw_set_color(merge_color(merge_color(c_dkgray,c_gray,hover),c_white,click));

draw_roundrect(x,y,x + width, y + height, 0)

draw_set_color(text_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt1);
draw_text(x + width/2, y + height/2, text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);