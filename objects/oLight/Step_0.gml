if enabled {
	ds_list_clear(light_collision);
	var _inst = collision_circle_list(x,y,light_radius,[oSolid],false,true,light_collision,true);
	if (_inst > 0) {
		//for (var i = 0; i < _inst; i++) {
		//	if (instance_exists(light_collision[| i])) {
		//		if (light_collision[| i].input_amount != undefined)  {
		//			var zzz = 256;
		//			zzz += light_collision[| i].input_amount
		//			zzz -= clamp(point_direction(x,y,light_collision[| i].x,light_collision[| i].y)/(light_radius/256),0,256)
		//			zzz += clamp(show_tm,0,256);
		//			with (light_collision[|i]) {
		//				input_amount = clamp(zzz,0,255)
		//			}
		//			//light_collision[| i].input_amount = clamp(zzz,0,255)
		//			//light_collision[| i].input_saturation = color_get_saturation(col);
		//			//light_collision[| i].input_hue = color_get_hue(col);
		//		}
		//	}
		//}
		for (var i = 0; i < _inst; i++) {
			with (light_collision[| i]) {
				if (input_amount != undefined)  {
					var zzz = 256;
					//zzz += input_amount
					zzz -= clamp(distance_to_point(other.x,other.y)/(other.light_radius/256),0,night_tm);
					zzz += input_amount;
					//zzz += clamp(show_tm,0,256);
					input_amount = clamp(zzz,0,255)
				}
			}
		}
	}
	if (follow != noone) {
		x = follow.x;
		y = follow.y;
	}
}