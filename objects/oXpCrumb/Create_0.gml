spd = random_range(0.9,1.3);
hsp = 0
vsp = 0
grav = 0.1
light = instance_create_layer(x,y,"Instances",oLight)
light.light_radius = 32;
light.follow = id;