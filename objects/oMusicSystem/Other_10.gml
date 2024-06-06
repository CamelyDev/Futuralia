///@desc Change Music

var _rand = irandom(real(BGM.INEXISTENCE));
switch(_rand) {
	case BGM.LOVE: current_bgm = audio_play_sound(mus_bg_love,1,false); break;
	case BGM.CLEITHROPHOBIA: current_bgm = audio_play_sound(mus_bg_cleithrophobia,1,false); break;
	case BGM.APEIROPHOBICSUMMIT: current_bgm = audio_play_sound(mus_bg_apeirophobicsummit,1,false); break;
	case BGM.WORRY: current_bgm = audio_play_sound(mus_bg_worry,1,false); break;
	case BGM.DONTFORGET: current_bgm = audio_play_sound(mus_bg_dontforget,1,false); break;
	case BGM.WAKEUP: current_bgm = audio_play_sound(mus_bg_wakeup,1,false); break;
	case BGM.CRUEL: current_bgm = audio_play_sound(mus_bg_cruel,1,false); break;
	case BGM.DAMNPIGS: current_bgm = audio_play_sound(mus_bg_damnpigs,1,false); break;
	case BGM.INEXISTENCE: current_bgm = audio_play_sound(mus_bg_inexistence,1,false); break;
}