var dir = point_direction(x,y,oPlayer2.x,oPlayer2.y);
hsp = lengthdir_x(spd,dir)
if (vsp<10) vsp += grav;
if (collision_check(x+hsp,y,oSolid)){
	while(!collision_check(x+sign(hsp),y,oSolid)){
		x+=sign(hsp)
	}
	hsp=0;
}
x += hsp;
//Vertical Collision
if (collision_check(x,y+vsp,oSolid)){
	while(!collision_check(x,y+sign(vsp),oSolid)){
		y+=sign(vsp)
	}
	vsp=0;
}
y += vsp