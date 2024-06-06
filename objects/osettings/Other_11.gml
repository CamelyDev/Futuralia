finalWorldSize = 3;
switch(real(subselector[ST.size])) {
	case 0: finalWorldSize = 3; break;
	case 1: finalWorldSize = 6; break;
	case 2: finalWorldSize = 12; break;
	case 3: finalWorldSize = 24; break;
	case 4: finalWorldSize = 32; break;
}
finalDifficulty = real(subselector[ST.diff]);
//||||||||||||||||||||||||||||||
ini_open("settings.ini");
//...............................
ini_write_real("Game","WorldSize",finalWorldSize);
ini_write_real("Game","Difficulty",finalDifficulty);
//...............................
ini_close();
//||||||||||||||||||||||||||||||
file_delete("blocks.ini");
file_delete("chunks.ini");
file_delete("regions.ini");
file_delete("worlds.ini");
alarm[0] = 4;