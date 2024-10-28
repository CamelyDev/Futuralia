//begteam
if (subselector[ST.size] < 0) {
	subselector[ST.size] = maxx[ST.size];
}
if (subselector[ST.size] > maxx[ST.size]) {
	subselector[ST.size] = 0;
}
if (subselector[ST.diff] < 0) {
	subselector[ST.diff] = maxx[ST.diff];
}
if (subselector[ST.diff] > maxx[ST.diff]) {
	subselector[ST.diff] = 0;
}
if (selector < 0) {
	selector = 2;
}
if (selector > 2) {
	selector = 0;
}
switch(selector) {
	default: str[0] = "Please select: "; break;
	case ST.size: str[0] = "World Size: "; break;
	case ST.diff: str[0] = "Difficulty: "; break;
}
switch(subselector[ST.size]) {
	default: str[1] = "Please select something."; break;
	case WS.tiny: str[1] = "Tiny (3 chunks)."; break;
	case WS.medium: str[1] = "Medium (6 chunks)."; break;
	case WS.large: str[1] = "Large (12 chunks)."; break;
	case WS.giant: str[1] = "Giant (24 chunks)."; break;
	case WS.extreme: str[1] = "Extreme (32 chunks, may break your PC)."; break;
}
switch(subselector[ST.diff]) {
	default: str[2] = "Please select something."; break;
	case DF.unlimited: str[2] = "Unlimited (Creative Mode)."; break;
	case DF.peaceful: str[2] = "Peaceful (No Monsters)."; break;
	case DF.easy: str[2] = "Easy."; break;
	case DF.medium: str[2] = "Normal."; break;
	case DF.hard: str[2] = "Hard."; break;
	case DF.insane: str[2] = "Insane."; break;
}