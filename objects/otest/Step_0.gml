//begteam
if (drawing = 2) and (yes) {
	for (var i = 0; i < array_length(blockArray); i++) {
		if (is_struct(blockArray[i])) {
			//var _inst = instance_create_layer(blockArray[i].pos.x*BS,blockArray[i].pos.y*BS,"Blocks",oSolid);
			//_inst.index = i;
			switch (blockArray[i].tlt) {
				case TT.blocks_main: curtlmp = tilemap_blocks; break;
				case TT.walls_main: curtlmp = tilemap_walls; break;
				case TT.background_main: curtlmp = tilemap_background; break;
				default: curtlmp = tilemap_blocks; break;
			}
			tilemap_set(curtlmp,blockArray[i].img+1,blockArray[i].pos.x,blockArray[i].pos.y);
		}
	}
	yes = false;
	canDraw = true;
	oPlayer2.y = 0;
}

