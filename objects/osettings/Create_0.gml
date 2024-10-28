//begteam
#macro BLOCKSTRIP 34
globalvar settingsArray, finalWorldSize, finalDifficulty, spriteArray, sprload;
settingsArray = [];
enum ST {
	start,
	size,
	diff,
	final
}
enum WS {
	tiny,
	medium,
	large,
	giant,
	extreme
}
enum DF {
	unlimited,
	peaceful,
	easy,
	medium,
	hard,
	insane
}
settingsArray[ST.size] = WS.tiny;
settingsArray[ST.diff] = DF.peaceful;
maxx = [];
maxx[ST.size] = 5;
maxx[ST.diff] = 5;
selector = 0;
subselected = false;
str = [];
str[0] = "";
subselector = [];
subselector[ST.size] = 0;
subselector[ST.diff] = 0;
finalWorldSize = power(real(subselector[ST.size]) + 1,2) * 4;
finalDifficulty = real(subselector[ST.diff]);
spriteArray = [];
sprload = [];
sprload[0] = false;
spriteArray[0] = sBlocksTest;
//sprr = http_get_file("https://drive.google.com/uc?export=download&id=11QYyKuhFzWMp_LEG1cjQ8P5_eCSXX7f-","blocks_strip" + string(BLOCKSTRIP) + ".png");
if (!audio_group_is_loaded(audiogroup1))
{
    audio_group_load(audiogroup1);
}