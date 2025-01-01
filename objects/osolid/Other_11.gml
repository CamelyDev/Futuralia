///@desc Update Blocktype

blocktype = blockArray[index].bt;
blockname = blockArray[index].nm
if (blockArray[index].spr == "") {
	sprite_index = -1;
} else {
	sprite_index = blockArray[index].spr
}

//image_index = blockArray[index].img;

switch(blocktype) {
	case BT.SOLID: isCollision = true; mask_index = sMask2; break;
	case BT.PASSABLE: isCollision = false; mask_index = sMask2; break;
	case BT.SLABDOWN: isCollision = true; mask_index = sMask3; break;
	case BT.SLABUP: isCollision = true; mask_index = sMask4; break;
	case BT.SLABRIGHT: isCollision = true; mask_index = sMask5; break;
	case BT.SLABLEFT: isCollision = true; mask_index = sMask6; break;
	default: isCollision = true; mask_index = sMask2; break;
}

switch(blockname) {
	case "Grass Block": material = "grass"; break;
	case "Dirt": material = "dirt"; break;
	default: material = "solid"; break;
}