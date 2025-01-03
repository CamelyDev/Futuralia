sprite_broadcast("footstep1",function(){
	ground_check();
	//pene .\.
	var sound = snd_footstep_solid1;
	switch(material_last) {
		case "plant": sound = snd_footstep_dirt1; break;
		case "rock": sound = snd_footstep_rock1; break;
		case "solid": sound = snd_footstep_solid1; break;
		case "ore": sound = snd_footstep_ore1; break;
		default: sound = snd_none; break;
	}
	
	audio_play_sound(sound,11,false,random_range(0.4,0.5),0,random_range(0.8,1.2));
})

sprite_broadcast("footstep2",function(){
	ground_check();
	//pene .\.
	var sound = snd_footstep_solid2;
	switch(material_last) {
		case "plant": sound = snd_footstep_dirt2; break;
		case "rock": sound = snd_footstep_rock2; break;
		case "solid": sound = snd_footstep_solid2; break;
		case "ore": sound = snd_footstep_ore2; break;
		default: sound = snd_none; break;
	}
	
	audio_play_sound(sound,11,false,random_range(0.4,0.5),0,random_range(0.8,1.2));
})