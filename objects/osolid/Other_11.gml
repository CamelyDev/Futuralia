///@desc Update Blocktype

blocktype = blockArray[index].bt;

sprite_index = asset_get_index(blockArray[index].spr);
image_index = blockArray[index].img;

switch(blocktype) {
	case BT.SOLID: isCollision = true; break;
	case BT.PASSABLE: isCollision = false; break;
	case BT.SLABDOWN: isCollision = true; break;
	case BT.SLABUP: isCollision = true; break;
	case BT.SLABRIGHT: isCollision = true; break;
	case BT.SLABLEFT: isCollision = true; break;
}