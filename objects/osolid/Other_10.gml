///@desc destroy if contact

//if (place_meeting(x,y,oCursor)) {
//	instance_destroy();
//	blockArray[index] = 0;
//}
//doesnt work anymore
//left for compatibilityfeven
if (place_meeting(x,y,oSolid)) {
	blockArray[index] = 0;
	instance_destroy();
}