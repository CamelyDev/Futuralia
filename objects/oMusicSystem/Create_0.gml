globalvar music_day, music_night, current_bgm;
music_day = audio_play_sound(snd_birds,0,true,show_tm/255);
music_night = audio_play_sound(snd_crickets,0,true,night_tm/255);
current_bgm = audio_play_sound(mus_bg_inexistence,1,false)

enum BGM {
	LOVE,
	CLEITHROPHOBIA,
	APEIROPHOBICSUMMIT,
	WORRY,
	DONTFORGET,
	WAKEUP,
	CRUEL,
	DAMNPIGS,
	INEXISTENCE
}

alarm[0] = irandom_range(15*GMSPD,20*GMSPD)