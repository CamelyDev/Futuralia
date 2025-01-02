//begteam

if (mouse_check_button(mb_left)) and (distance_to_object(oCursor) < 1) and (distance_to_object(oPlayer2) < 4*BS) {
	if(oPlayer2.strength >= blockArray[index]._blockore._harvest_level) {
		mining = true;
		dest += abs(-(blockArray[index].res) / (101 - oPlayer2.strength_bonus));
		if fsi <= 0 {
			alarm[0] = 2;
			fsi = 8;
		} else {
			fsi--;
		}
	} else {
		mining = false;
		fsi = 8;
	}
} else {
	mining = true;
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
	if (blockArray[index]._blockore._drop_xp != 0) {
		instance_create_depth(x+4,y+4,depth,oXpCrumb,{
			xp_to_add: blockArray[index]._blockore._drop_xp
		});
	}
	blockArray[index] = 0;
	instance_destroy();
	//oPlayer2.xp_add(blockArray[index]._blockore._drop_xp);
	//ds_grid_set(blockGrid,x div BS, abs(y div BS),-1);
}