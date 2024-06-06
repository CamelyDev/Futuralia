switch(curblock) {
	case undefined: {
		draw_sprite(sCursor,curstate,x,y);
	} break;
	default: {
		draw_sprite_ext(sBlocks,curblock,x,y,1,1,0,c_white,0.5);
		draw_sprite_ext(sCursor,curstate,x,y,1,1,0,c_white,0.5);
	} break;
}