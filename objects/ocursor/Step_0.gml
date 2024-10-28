//begteam

x = snapp(main_cam.get_mouse_x(), BS);
y = snapp(main_cam.get_mouse_y(), BS);

if (curselector > MAX_BLOCKSELECTOR) curselector = 0;
if (curselector < 0) curselector = MAX_BLOCKSELECTOR;

switch(curselector) {
	case 0: {
		curblock = undefined
	} break;
	
	case 1: {
		curblock = BL.brick
	} break;
	
	case 2: {
		curblock = BL.woodplanks
	} break;
	
	case 3: {
		curblock = BL.woodwall
	} break;
	
	case 4: {
		curblock = BL.woodchairleft
	} break;
	
	case 5: {
		curblock = BL.woodchairright
	} break;
	
	case 6: {
		curblock = BL.woodtable
	} break;
	
	case 7: {
		curblock = BL.woodslabup
	} break;
	
	case 8: {
		curblock = BL.woodslabdown
	} break;
	
	case 9: {
		curblock = BL.woodslableft
	} break;
	
	case 10: {
		curblock = BL.woodslabright
	} break;
}

if (mouse_check_button(mb_right)) {
	if (block_check(x,y) and distance_to_object(oPlayer2) < 6*BS) and (curblock != undefined) and (fpi == 0) {
		//with (oSolid) {
		//	event_user(0);
		//}
		//instance_create_layer(x,y,"Blocks",oChecker);
		//alarm[0] = 1;
		var bl = blocks[curblock];
		var tile;
		switch (bl.tlt) {
			case TT.background_main: tile = tilemap_background; break;
			case TT.blocks_main: tile = tilemap_blocks; break;
			case TT.walls_main: tile = tilemap_walls; break;
			default: tile = tilemap_blocks; break;
		}
		
		tilemap_set_at_pixel(tile,curblock+1,x,y);
		fpi = FPI_MAX;
	} else {
		if (fpi == 0) {
			curstate = CURSORSTATE.DENY;
		}
	}
} else {
	if (fpi == 0) {
		curstate = CURSORSTATE.IDLE;
	}
}

curblpos = tile_get_index(block_check_return(x,y));

if (keyboard_check(vk_control) or mouse_check_button(mb_left)) and distance_to_object(oPlayer2) < 6*BS and (fpi == 0) {
	if (dest < 1) {
		dest += abs(-(blockArray[curblpos].res) / 100);
	} else {
		block_set_empty(x,y);
		event_user(0);
		fpi = FPI_MAX;
		dest = 0;
	}
} else {
	dest = 0;
}

if (fpi > 0) fpi--;
//else {
//	dest = 0;
//}

//if (fdi > 0) fdi--;

if (distance_to_object(oPlayer2) >= 6*BS) {
	curstate = CURSORSTATE.OOB;
}

