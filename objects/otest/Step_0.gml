//begteam
if (drawing = 2) and (yes) {
	for (var i = 0; i < array_length(blockArray); i++) {
		if (is_struct(blockArray[i])) {
			var _inst = instance_create_layer(blockArray[i].pos.x*BS,blockArray[i].pos.y*BS,"Blocks",oSolid);
			_inst.index = i;
		}
	}
	yes = false;
	canDraw = true;
	oPlayer2.y = -(HEIGHT)*BS;
}