//initialize wariables
#macro TIME_RATE 0.1
#macro HOLD_TIME 256
#macro DECAY_TIME 192
#macro TIME_OFFSET 255
instance_create_layer(x,y,"Instances",oCameraPoint);
globalvar light_surface;
light_surface = surface_create(finalWorldSize*CHUNKSIZE*BS,HEIGHT*BS);
light = instance_create_layer(x,y,"Instances",oLight)
light.light_radius = 96;
light.follow = id;

zoo = 1;
grav = 0.3;
hsp = 0;
finalhsp = 0;
vsp = 0;
jsp = 6.3;
msp = 2.5;
jumps = 0;

clmp = 0;

ground_check = function() {
	var _inst = instance_place(x,y+1,oSolid);
	with (_inst) {
		other.material_last = material;
	}
}

material_last = "solid";

var _inst = instance_nearest(x,y-10000,oSolid);
if (_inst != noone) {
	oPlayer2.x = _inst.x
	oPlayer2.y = _inst.y;
}
y -= HEIGHT * BS;
isGrounded = false;
fpi = 1;
what = true;
free = false;
jumping = false;
attach_point = new vector2(0,-25);
rotated = false;
rotation = 0;
rotdraw = 0;
canrotdraw = false;
headstate = 0;
imagescale = 1;
position = new vector2(0,-1000);
_imagey = 1;

globalvar tm, show_tm, night_tm, debug;
tm = 0;
show_tm = TIME_OFFSET;
night_tm = 0;
max_tm = false;
hold_tm = 0;
debug = false;

head = new head_state(sPlayerHead,0,attach_point,1,0);

playerclock = new IotaClock();
playerclock.SetUpdateFrequency(60);

playerclock.DefineInput("jump",false);
playerclock.DefineInput("left",false);
playerclock.DefineInput("right",false);
playerclock.DefineInput("run",false);
playerclock.DefineInputMomentary("jump_press",false);

playerclock.AddTickUserEvents(undefined,14,undefined);