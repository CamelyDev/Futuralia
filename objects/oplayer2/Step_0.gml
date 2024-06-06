//begteam
//key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
//key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
//key_left_1 = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
//key_right_1 = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
//key_jump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space);
//key_jump_held = keyboard_check(vk_up) || keyboard_check(vk_space);
//key_attack = keyboard_check(vk_control) || mouse_check_button(mb_left);
//key_run = keyboard_check(vk_shift);

var mx, my;
mx = main_cam.get_mouse_x();
my = main_cam.get_mouse_y();

var kjump, kleft, kright, krun, kjumppress;
kjump = keyboard_check(vk_space)
kleft = keyboard_check(ord("A"))
kright = keyboard_check(ord("D"))
krun = keyboard_check(vk_shift)
kjumppress = keyboard_check_pressed(vk_space)

playerclock.SetInput("jump",kjump);
playerclock.SetInput("left",kleft);
playerclock.SetInput("right",kright);
playerclock.SetInput("run",krun);
playerclock.SetInput("jump_press",kjumppress);

playerclock.Update();

//key_right = keyboard_check(ord("D"));
//key_left = keyboard_check(ord("A"));
//key_left_1 = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
//key_right_1 = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
//key_jump = keyboard_check_pressed(vk_space);
//key_jump_release = keyboard_check_released(vk_space);
//key_jump_held = keyboard_check(vk_space);
//key_attack = mouse_check_button(mb_left);
//key_run = keyboard_check(vk_shift);
//var move;
//move = key_right + -key_left;
//hsp = move * msp;
//if (vsp<10) vsp += grav;

//if (place_meeting(x,y+1,[oSolid])){
//	jumping = false;
//	vsp = key_jump_held * -jsp
//}
//if (vsp < 0) && (!key_jump_held) vsp = max(vsp,-jsp/4)
////Horizontal Collision
//if (place_meeting(x+hsp,y,[oSolid])){
//while(!place_meeting(x+sign(hsp),y,[oSolid])){
//x+=sign(hsp)
//}
//hsp=0;
//}
//x += hsp;
////Vertical Collision
//if (place_meeting(x,y+vsp,[oSolid])){
//while(!place_meeting(x,y+sign(vsp),[oSolid])){
//y+=sign(vsp)
//}
//vsp=0;
//}
//y += vsp;


//if (key_jump_held) jumping = true;
//var imagescale = -sign(x - mx);
//if (imagescale != 0) {
//	image_xscale = imagescale
//	if (rotated = true) {
//		_imagey = imagescale;
//	} else {
//		_imagey = 1;
//	}
//}

image_speed = msp / 2.5;

//if (rotation < 60) or (rotation > 120 and rotation < 240) or (rotation > 300) {
//	canrotdraw = true;
//} else {
//	canrotdraw = false;
//}

//if canrotdraw {
//	rotdraw = rotation
//}

//if (hsp != 0) {
//	if (hsp > 0) and (image_xscale < 0) {
//		msp = 2.1;
//	} else if (hsp < 0) and (image_xscale > 0) {
//		msp = 2.1;
//	} else {
//		if (key_run) {
//			if msp < 3.9 {
//				msp += 0.1;
//			}
//		} else {
//			msp = 2.5
//		}
//	}
	
//	if (vsp == 0) and (place_meeting(x,y+1,[oSolid])) {
//		sprite_index = sPlayerWalk;
//		headstate = 1;
//		rotated = true;
//	} else if (jumping = true) {
//		sprite_index = sPlayerJumpSpecial;
//		headstate = image_index;
//		rotated = true;
//	} else if (vsp != 0) and (jumping = false) {
//		sprite_index = sPlayerJump;
//		headstate = 1;
//		rotated = true;
//	}
//} else {
//	if (vsp == 0) and (place_meeting(x,y+1,[oSolid])) {
//		sprite_index = sPlayerIdle;
//		headstate = 1;
//		rotated = true;
//	} else if (jumping = true) {
//		 sprite_index = sPlayerJumpSpecial;
//		 headstate = image_index;
//		 rotated = true;
//	} else if (vsp != 0) and (jumping = false) {
//		sprite_index = sPlayerJump;
//		headstate = 1;
//		rotated = true;
//	}
//}

head._rot = rotdraw;
head._state = headstate;
head._flip = _imagey;

var w = main_cam.width / 2;
var h = main_cam.height / 2;
clmp = (finalWorldSize*CHUNKSIZE)-((w*2)/BS);
var _xx = clamp(x-w,0,clmp*BS)+w
var _yy = y;
oCameraPoint.x = _xx;
oCameraPoint.y = _yy;

//if (fpi <= 0) {
//	var _vw = main_cam.width;
//	var _vh = main_cam.height;
//	var _vx = main_cam.x - (_vw div 2);
//	var _vy = main_cam.y - (_vh div 2);
//	instance_deactivate_layer(layer_get_id("Blocks"));
//	instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128,true);
//	instance_activate_layer(layer_get_id("Instances"));
//	fpi = 10;
//} else {
//	fpi--;
//}

//msp = clamp(msp,2.1,3.9);
if (x > finalWorldSize*CHUNKSIZE*BS) {
	x = xprevious;
	show_message("You have reached the limit of the world!\nPlease don't go further. Thanks!")
}
if (x < 0) {
	x = xprevious;
	show_message("You have reached the limit of the world!\nPlease don't go further. Thanks!")
}
position.x = x div BS;
position.y = y div BS;


//light calculation

//time system
//tm += TIME_RATE;
//if (max_tm) {
//	if (show_tm > 255) {
//		max_tm = false;
//		hold_tm = HOLD_TIME;
//	}
	
//	if (hold_tm > 0) {
//		hold_tm -= TIME_RATE;
//	} else {
//		show_tm += TIME_RATE;
//		night_tm -= TIME_RATE;
//	}
//} else {
//	if (show_tm <= 0) {
//		max_tm = true;
//		hold_tm = HOLD_TIME;
//	}
	
//	if (hold_tm > 0) {
//		hold_tm -= TIME_RATE;
//	} else {
//		show_tm -= TIME_RATE;
//		night_tm += TIME_RATE;
//	}
//}

layer_background_alpha(layer_background_get_id("Dark_Night"),abs(((show_tm/255)*-1)+1))

global.sharedProperties = {
	_player_pos : new vector2(x,y),
	_head : head,
	_player_spr : sprite_index,
	_player_img : image_index,
	_player_flip : image_xscale
}