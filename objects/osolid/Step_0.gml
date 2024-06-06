//begteam

if (keyboard_check(vk_control) or mouse_check_button(mb_left)) and (distance_to_object(oCursor) < 1) {
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
var zzz;
zzz = clamp(show_tm,0,256);
input_amount = clamp(zzz,0,255);

blocktype = blockArray[index].bt;

switch(blocktype) {
	case BT.SOLID: mask_index = sMask2; break;
	case BT.PASSABLE: mask_index = sMask1; break;
	case BT.SLABDOWN: mask_index = sMask3; break;
	case BT.SLABUP: mask_index = sMask4; break;
	case BT.SLABRIGHT: mask_index = sMask5; break;
	case BT.SLABLEFT: mask_index = sMask6; break;
}

if (dest >= 1) {
	instance_destroy();
	blockArray[index] = 0;
	ds_grid_set(blockGrid,x div BS, abs(y div BS),-1);
}