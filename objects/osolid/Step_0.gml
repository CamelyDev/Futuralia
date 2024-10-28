//begteam

if (keyboard_check(vk_control) or mouse_check_button(mb_left)) and (distance_to_object(oCursor) < 1) and (distance_to_object(oPlayer2) < 6*BS) {
	dest += abs(-(blockArray[index].res) / 100);
	if fsi <= 0 {
		alarm[0] = 2;
		fsi = 8;
	} else {
		fsi--;
	}
} else {
	fsi = 2;
	if (foi <= 0) {
		if (dest > 0) {
			dest -= abs(-(blockArray[index].res) / 100);
		}
		foi = 12;
	} else {
		foi--;
	}
}

//var bc = block_check(x,y,block_radius)

if (dest >= 1) {
	instance_destroy();
	blockArray[index] = 0;
	//ds_grid_set(blockGrid,x div BS, abs(y div BS),-1);
}