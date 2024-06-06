//----MAIN VARIABLES----

var mx, my;
mx = main_cam.get_mouse_x();
my = main_cam.get_mouse_y();

var key_jump, key_jump_held, key_left, key_right, key_run;
key_jump_held = IotaGetInput("jump");
key_jump = IotaGetInput("jump_press");
key_left = IotaGetInput("left");
key_right = IotaGetInput("right");
key_run = IotaGetInput("run");

//----MOVEMENT----

var mov;
mov = key_right + -key_left;
hsp = mov * msp;
if (vsp<10) vsp += grav;

if (place_meeting(x,y+1,[oCol])){
	jumping = false;
	vsp = key_jump_held * -jsp
}
if (vsp < 0) && (!key_jump_held) vsp = max(vsp,-jsp/4)
//Horizontal Collision
if (place_meeting(x+hsp,y,[oCol])){
while(!place_meeting(x+sign(hsp),y,[oCol])){
x+=sign(hsp)
}
hsp=0;
}
x += hsp;
//Vertical Collision
if (place_meeting(x,y+vsp,[oCol])){
while(!place_meeting(x,y+sign(vsp),[oCol])){
y+=sign(vsp)
}
vsp=0;
}
y += vsp;

//----IMAGE----

if (key_jump_held) jumping = true;
var imagescale = -sign(x - mx);
if (imagescale != 0) {
	image_xscale = imagescale
	if (rotated = true) {
		_imagey = imagescale;
	} else {
		_imagey = 1;
	}
}

//----ROTATION----

var _ang, _diff;
_ang = point_direction(x,y,mx,my);
_diff = angle_difference(_ang,rotation);
if (rotated) {
	rotation += _diff * 0.15
} else {
	rotation = 0;
}

//----SPRITE MANAGEMENT----

if (hsp != 0) {
	if (hsp > 0) and (image_xscale < 0) {
		msp = 2.1;
	} else if (hsp < 0) and (image_xscale > 0) {
		msp = 2.1;
	} else {
		if (key_run) {
			if msp < 3.9 {
				msp += 0.1;
			}
		} else {
			msp = 2.5
		}
	}
	
	if (vsp == 0) and (place_meeting(x,y+1,[oCol])) {
		sprite_index = sPlayerWalk;
		headstate = 1;
		rotated = true;
	} else if (jumping = true) {
		sprite_index = sPlayerJumpSpecial;
		headstate = image_index;
		rotated = true;
	} else if (vsp != 0) and (jumping = false) {
		sprite_index = sPlayerJump;
		headstate = 1;
		rotated = true;
	}
} else {
	if (vsp == 0) and (place_meeting(x,y+1,[oCol])) {
		sprite_index = sPlayerIdle;
		headstate = 1;
		rotated = true;
	} else if (jumping = true) {
		 sprite_index = sPlayerJumpSpecial;
		 headstate = image_index;
		 rotated = true;
	} else if (vsp != 0) and (jumping = false) {
		sprite_index = sPlayerJump;
		headstate = 1;
		rotated = true;
	}
}

//----OTHER STUFF----

if (fpi <= 0) {
	var _vw = main_cam.width;
	var _vh = main_cam.height;
	var _vx = main_cam.x - (_vw div 2);
	var _vy = main_cam.y - (_vh div 2);
	instance_deactivate_layer(layer_get_id("Blocks"));
	instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128,true);
	instance_activate_layer(layer_get_id("Instances"));
	fpi = 10;
} else {
	fpi--;
}

msp = clamp(msp,2.1,3.9);

//----TIME SYSTEM----

tm += TIME_RATE;
if (max_tm) {
	if (show_tm > 255) {
		max_tm = false;
		hold_tm = HOLD_TIME;
	}
	
	if (hold_tm > 0) {
		hold_tm -= TIME_RATE;
	} else {
		show_tm += TIME_RATE;
		night_tm -= TIME_RATE;
	}
} else {
	if (show_tm <= 0) {
		max_tm = true;
		hold_tm = HOLD_TIME;
	}
	
	if (hold_tm > 0) {
		hold_tm -= TIME_RATE;
	} else {
		show_tm -= TIME_RATE;
		night_tm += TIME_RATE;
	}
}
