audio_sound_gain(music_day,(show_tm/255),0);
audio_sound_gain(music_night,(night_tm/255),0);
if (audio_exists(current_bgm)) audio_sound_gain(current_bgm,0.5,0);