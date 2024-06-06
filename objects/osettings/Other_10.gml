//begteam
if (file_exists("settings.ini")) {

	//||||||||||||||||||||||||||||||
	ini_open("settings.ini");
	//...............................
	finalWorldSize = ini_read_real("Game","WorldSize",16);
	finalDifficulty = ini_read_real("Game","Difficulty",DF.unlimited);
	//...............................
	ini_close();
	//||||||||||||||||||||||||||||||
	
	show_debug_message("going to generate world")
	
	alarm[0] = 4;
}