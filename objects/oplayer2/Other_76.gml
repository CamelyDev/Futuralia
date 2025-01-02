sprite_broadcast("footstep1",function(){
	ground_check();
	//pene .\.
	var sound = snd_footstep_solid1;
	switch(material_last) {
		case "grass": sound = snd_footstep_grass1; break;
		case "dirt": sound = snd_footstep_dirt1; break;
		default: sound = snd_footstep_solid1; break;
	}
	
	audio_play_sound(sound,11,false,random_range(0.4,0.5),0,random_range(0.8,1.2));
})

sprite_broadcast("footstep2",function(){
	ground_check();
	//pene .\.
	var sound = snd_footstep_solid2;
	switch(material_last) {
		case "grass": sound = snd_footstep_grass2; break;
		case "dirt": sound = snd_footstep_dirt2; break;
		default: sound = snd_footstep_solid2; break;
	}
	
	audio_play_sound(sound,11,false,random_range(0.4,0.5),0,random_range(0.8,1.2));
})