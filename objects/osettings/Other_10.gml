//begteam
if (file_exists("settings")) {

	//||||||||||||||||||||||||||||||
	ini_open("settings");
	//...............................
	finalWorldSize = ini_read_real("Game","WorldSize",16);
	finalDifficulty = ini_read_real("Game","Difficulty",DF.unlimited);
	//...............................
	ini_close();
	//||||||||||||||||||||||||||||||
	
	print("going to generate world")
	
	alarm[0] = 4;
} else {
	throw ("Settings file not found")
}