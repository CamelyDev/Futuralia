//begteam

globalvar canDraw; //, tilemap_walls, tilemap_blocks, tilemap_background;
drawing = 0;
yes = true;
canDraw = false;
//tilemap_blocks = layer_tilemap_create("Blocks",0,0,BLSPRITE,finalWorldSize*CHUNKSIZE,HEIGHT)
//tilemap_walls = layer_tilemap_create("Walls",0,0,BLSPRITE,finalWorldSize*CHUNKSIZE,HEIGHT)
//tilemap_background = layer_tilemap_create("Background",0,0,BLSPRITE,finalWorldSize*CHUNKSIZE,HEIGHT)
worldgen_init();
randomize()
random_set_seed(irandom(99999));

//light_layer = layer_get_id("Lights");
//layer_script_begin(light_layer,light_draw_begin);
//layer_script_end(light_layer,light_draw_end);

//curtlmp = tilemap_blocks;

enum BT {
	PASSABLE,
	SOLID,
	SLABUP,
	SLABDOWN,
	SLABLEFT,
	SLABRIGHT
}


alarm[0] = 10;

plr = undefined;
playerData = -1
//gpu_set_blendenable(true);