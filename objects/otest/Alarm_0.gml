///@desc create
//begteam
//plr = instance_create_layer(32,0,"Instances",oPlayer2)
if (drawing == 0) {
	if (!file_exists("blocks-" + string(worldSlot))) {
		tst_create();
		CameraClean()
	}
}
drawing = 1;
alarm[1] = 3;