//begteam

x = snapp(main_cam.get_mouse_x(), BS);
y = snapp(main_cam.get_mouse_y(), BS);

if (mouse_check_button_pressed(mb_right)) {
	if (!place_meeting(x,y,oSolid) and distance_to_object(oPlayer2) < 6*BS) and (curblock != undefined) {
		//with (oSolid) {
		//	event_user(0);
		//}
		instance_create_layer(x,y,"Blocks",oChecker);
		alarm[0] = 1;
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

if (fpi > 0) fpi--;

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