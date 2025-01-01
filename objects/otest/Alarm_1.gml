///@desc load
//begteam
if (drawing != 2) {
	playerData = tst_load();
	oPlayer2.xp = playerData.xp;
	oPlayer2.show_xp = playerData.show_xp;
	oPlayer2.strength = playerData.strength;
	oPlayer2.strength_to_rebirth = playerData.strength_to_rebirth;
	oPlayer2.rebirths = playerData.rebirths;
	//var _vx = camera_get_view_x(view_camera[0]);
	//var _vy = camera_get_view_y(view_camera[0]);
	//var _vw = camera_get_view_width(view_camera[0]);
	//var _vh = camera_get_view_height(view_camera[0]);
	//instance_deactivate_layer(layer_get_id("Blocks"));
	//instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128,true);
	//instance_activate_layer(layer_get_id("Instances"));
	CameraClean()
}
alarm[2] = 2;