//begteam
if debug {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt1);
	draw_text(0,0,"Position: " + string(position.x) + ", " + string(position.y));
	draw_text(0,16,"FPS: " + string(fps));
	draw_text(0,32,"REAL FPS: " + string(fps_real));
	draw_text(0,48,"Clamp: " + string(clmp));
	draw_text(0,64,"World Size: " + string(finalWorldSize*CHUNKSIZE));
	draw_text(0,80,"Time Info: " + string(floor(tm)) + ", " + string(floor(hold_tm)) + ", " + string(floor(show_tm)));
	draw_text(0,96,"World Seed: " + string(random_get_seed()));
	draw_text(0,112,"Music Time: " + string(oMusicSystem.alarm[0]));
}
if (oTest.drawing <= 0) {
	draw_set_color(c_black);
	draw_rectangle(0,0,global.gui_w,global.gui_h,false);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(global.gui_w/2,global.gui_h/2,"Loading Terrain \n(may take long enough,\ngo make a coffee!)");
}