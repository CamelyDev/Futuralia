if (!audio_is_playing(current_bgm)) {
	event_user(0)
}
alarm[0] = irandom_range(250*GMSPD,500*GMSPD)