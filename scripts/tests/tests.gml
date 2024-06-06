//begteam
#macro BS 16
#macro WORLDSIZE 16
#macro REGSIZE 16
#macro CHUNKSIZE 48
#macro HEIGHT 256
#macro BLSPRITE "sBlocks"
#macro GAMEVER "0.0.1"
#macro DEFAULTPATH working_directory

function worldgen_init() {
	enum BL {
		dirt,
		grass,
		stone,
		brick,
		quartz,
		emerald,
		citrine,
		diamond,
		amethyst,
		onyx,
		ruby,
		sapphire,
		jasper,
		tigerseye,
		sugilite,
		woodplanks,
		woodslabup,
		woodslabdown,
		woodslableft,
		woodslabright,
		woodwall,
		woodchairleft,
		woodchairright,
		woodtable
	}
	enum IT {
		pickaxe,
		dirt,
		grass,
		stone,
		brick
	}
	enum TM {
		pick,
		ax,
		hoe,
		shovel
	}
	globalvar worldArray, regionArray, chunkArray, blockArray, currentPos, blocks, items, spriteBlocks, blockGrid;
	blockGrid = ds_grid_create(finalWorldSize * CHUNKSIZE,HEIGHT);
	regionArray = array_create(1);
	chunkArray = array_create(1);
	blockArray = array_create(1);
	worldArray = array_create(1);
	currentPos = 0;
	blocks = array_create(4);
	items = array_create(5);
	//....................................................................
	//....................................................................
	//....................................................................
	//....................................................................
	/*	function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		tilePlace : undefined,
		toolDone : undefined,
		itemdrop : undefined,
		is_solid : undefined,
	*/
	//....................................................................
	//....................................................................
	//....................................................................
	var extras = {
		function1 : function(vec2) {
			var inst = instance_position(vec2.x*BS,vec2.y*BS,oSolid);
			blockArray[inst.index] = 0;
			with (inst) {
				instance_destroy();
			}
			return true;
		},
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		tilePlace : undefined,
		toolDone : undefined,
		itemdrop : undefined,
		is_solid : undefined
	}
	var extra = {
		function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		tilePlace : undefined,
		itemdrop : undefined,
		is_solid : undefined,
		toolDone : new tool("T1 Pickaxe",TM.pick,1,1.5,extras)
	}
	items[IT.pickaxe] = new item_a("Beginner Pickaxe",sItemsTest,0,extra);
	//....................................................................
	//....................................................................
	//....................................................................
	var extras = {
		function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		tilePlace : undefined,
		toolDone : undefined,
		is_solid : undefined,
		itemdrop :  new item_a("Dirt",BLSPRITE,1,extra)
	}
	var extra = {
		function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		toolDone : undefined,
		itemdrop : undefined,
		is_solid : undefined,
		tilePlace : new block("Dirt",BLSPRITE,1,2.4,0,new vector2(0,0),extras)
	}
	items[IT.dirt] = new item_a("Dirt",BLSPRITE,1,undefined);
	//....................................................................
	var extras = {
		function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		tilePlace : undefined,
		toolDone : undefined,
		is_solid : undefined,
		itemdrop : new item_a("Grass Block",BLSPRITE,0,extra)
	}
	var extra = {
		function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		toolDone : undefined,
		itemdrop : undefined,
		is_solid : undefined,
		tilePlace : new block("Grass Block",BLSPRITE,0,2.3,0,new vector2(0,0),extras)
	}
	items[IT.grass] = new item_a("Grass Block",BLSPRITE,0,undefined);
	//....................................................................
	var extras = {
		function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		tilePlace : undefined,
		toolDone : undefined,
		is_solid : undefined,
		itemdrop : new item_a("Wood Planks",BLSPRITE,27,extra)
	}
	var extra = {
		function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		toolDone : undefined,
		itemdrop : undefined,
		is_solid : undefined,
		tilePlace : new block("Wood Planks",BLSPRITE,27,2,0,new vector2(0,0),undefined)
	}
	items[IT.brick] = new item_a("Wood Planks",BLSPRITE,27,undefined);
	//....................................................................
	var extras = {
		function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		tilePlace : undefined,
		toolDone : undefined,
		is_solid : undefined,
		itemdrop : new item_a("Wood Planks",BLSPRITE,4,extra)
	}
	var extra = {
		function1 : undefined,
		function2 : undefined,
		function3 : undefined,
		function4 : undefined,
		toolDone : undefined,
		itemdrop : undefined,
		is_solid : undefined,
		tilePlace : new block("Stone",BLSPRITE,4,1.6,1,new vector2(0,0),undefined)
	}
	items[IT.brick] = new item_a("Stone",BLSPRITE,4,undefined);
	////....................................................................
	////....................................................................
	////....................................................................
	//var extras = {
	//	function1 : undefined,
	//	function2 : undefined,
	//	function3 : undefined,
	//	function4 : undefined,
	//	tilePlace : undefined,
	//	toolDone : undefined,
	//	is_solid : undefined,
	//	itemdrop : items[IT.dirt]
	//}
	//blocks[BL.dirt] = new block("Dirt",BLSPRITE,1,2.4,0,new vector2(0,0),BT.SOLID);
	////....................................................................
	//var extras = {
	//	function1 : undefined,
	//	function2 : undefined,
	//	function3 : undefined,
	//	function4 : undefined,
	//	tilePlace : undefined,
	//	toolDone : undefined,
	//	is_solid : undefined,
	//	itemdrop : items[IT.grass]
	//}
	//blocks[BL.grass] = new block("Grass Block",BLSPRITE,0,2.3,0,new vector2(0,0),BT.SOLID);
	////....................................................................
	//var extras = {
	//	function1 : undefined,
	//	function2 : undefined,
	//	function3 : undefined,
	//	function4 : undefined,
	//	tilePlace : undefined,
	//	toolDone : undefined,
	//	is_solid : undefined,
	//	itemdrop : items[IT.stone]
	//}
	//blocks[BL.stone] = new block("Stone",BLSPRITE,2,1.6,1,new vector2(0,0),BT.SOLID);
	////....................................................................
	//var extras = {
	//	function1 : undefined,
	//	function2 : undefined,
	//	function3 : undefined,
	//	function4 : undefined,
	//	tilePlace : undefined,
	//	toolDone : undefined,
	//	is_solid : undefined,
	//	itemdrop : items[IT.planks]
	//}
	//blocks[BL.planks] = new block("Wood Planks",BLSPRITE,3,2,0,new vector2(0,0),BT.SOLID);
	//....................................................................
	worldgen_common()
	worldgen_ores()
	
}

function worldgen_common() {
	blocks[BL.dirt] = new block("Dirt",BLSPRITE,1,2.4,0,new vector2(0,0),BT.SOLID);
	blocks[BL.grass] = new block("Grass Block",BLSPRITE,0,2.3,0,new vector2(0,0),BT.SOLID);
	blocks[BL.stone] = new block("Stone",BLSPRITE,2,1.6,1,new vector2(0,0),BT.SOLID);
	blocks[BL.brick] = new block("Bricks",BLSPRITE,3,2.2,0,new vector2(0,0),BT.SOLID);
	blocks[BL.woodplanks] = new block("Wood Planks",BLSPRITE,15,2,0,new vector2(0,0),BT.SOLID);
	blocks[BL.woodslabup] = new block("Wood Slab (Up)",BLSPRITE,16,2,0,new vector2(0,0),BT.SLABUP);
	blocks[BL.woodslabdown] = new block("Wood Slab (Down)",BLSPRITE,17,2,0,new vector2(0,0),BT.SLABDOWN);
	blocks[BL.woodslableft] = new block("Wood Slab (Left)",BLSPRITE,18,2,0,new vector2(0,0),BT.SLABLEFT);
	blocks[BL.woodslabright] = new block("Wood Slab (Right)",BLSPRITE,19,2,0,new vector2(0,0),BT.SLABRIGHT);
	blocks[BL.woodwall] = new block("Wood Wall",BLSPRITE,20,2.6,0,new vector2(0,0),BT.PASSABLE);
	blocks[BL.woodchairleft] = new block("Wood Chair (Left)",BLSPRITE,21,2.5,0,new vector2(0,0),BT.PASSABLE);
	blocks[BL.woodchairright] = new block("Wood Chair (Right)",BLSPRITE,22,2.5,0,new vector2(0,0),BT.PASSABLE);
	blocks[BL.woodtable] = new block("Wood Table",BLSPRITE,23,2.3,0,new vector2(0,0),BT.PASSABLE);
}

function worldgen_ores() {
	blocks[BL.quartz] = new block("Quartz",BLSPRITE,4, 1.5 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.emerald] = new block("Emerald",BLSPRITE,5, 1.4 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.citrine] = new block("Citrine",BLSPRITE,6, 1.3 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.diamond] = new block("Diamond",BLSPRITE,7, 1.2 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.amethyst] = new block("Amethyst",BLSPRITE,8, 1.1 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.onyx] = new block("Onyx",BLSPRITE,9, 1.0 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.ruby] = new block("Ruby",BLSPRITE,10, 0.9 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.sapphire] = new block("Sapphire",BLSPRITE,11, 0.8 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.jasper] = new block("Jasper",BLSPRITE,12, 0.7 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.tigerseye] = new block("Tiger's Eye",BLSPRITE,13, 0.6 ,1,new vector2(0,0),BT.SOLID);
	blocks[BL.sugilite] = new block("Sugilite",BLSPRITE,14, 0.5 ,1,new vector2(0,0),BT.SOLID);
}

function worldgen_get_ore(xx,yy,mult) {
	var chanceArray, chanceResult, bl, oldseed;
	oldseed = random_get_seed();
	randomize()
	chanceArray = [
		100,
		22*mult,
		21*mult,
		18*mult,
		17*mult,
		15*mult,
		13*mult,
		9*mult,
		5*mult,
		3*mult,
		1*mult,
		1/5*mult
	]
	chanceResult = chanceCustom(chanceArray);
	switch(chanceResult) {
		case 0: {
			bl = blocks[BL.stone].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 1: {
			bl = blocks[BL.quartz].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 2: {
			bl = blocks[BL.emerald].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 3: {
			bl = blocks[BL.citrine].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 4: {
			bl = blocks[BL.diamond].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 5: {
			bl = blocks[BL.amethyst].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 6: {
			bl = blocks[BL.onyx].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 7: {
			bl = blocks[BL.ruby].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 8: {
			bl = blocks[BL.sapphire].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 9: {
			bl = blocks[BL.jasper].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 10: {
			bl = blocks[BL.tigerseye].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		case 11: {
			bl = blocks[BL.sugilite].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
		
		default: {
			bl = blocks[BL.stone].Copy();
			bl.pos = new vector2(xx div BS,yy div BS);
		} break;
	}
	random_set_seed(oldseed);
	return bl;
}

function chance(perc){
	var rand = irandom(100);
	return rand < perc ? true : false;
}

function chanceint(perc){
	var rand = irandom(100);
	return rand < perc ? 1 : 0;
}

function chanceCustom(rarityarray) {
	var rand = random(100);
	var finalRarity = -1;
	
	for (var i = 0; i < array_length(rarityarray); i++) {
		if (rand <= rarityarray[i]) {
			finalRarity = i;
		} else {
			break;
		}
	}
	
	return finalRarity;
}

function world_creation(wrld) {
	array_push(worldArray,wrld);
}

function region_gen(reg) {
	array_push(regionArray,reg);
}

function chunk_gen(chu) {
	array_push(chunkArray,chu);
}

function block_gen(blo) {
	array_push(blockArray,blo);
	
	return array_length(blockArray) - 1;
}

function call_block_add(bl) {
	ds_grid_set(blockGrid,bl.pos.x div BS, abs(bl.pos.y div BS),bl);
	var inst = instance_create_layer(bl.pos.x * BS,bl.pos.y * BS,"Blocks",oSolid);
	inst.index = block_gen(bl);
}

function fill_arrs(wrld,reg,chu,blo) {
	array_push(worldArray,wrld);
	array_push(regionArray,reg);
	array_push(chunkArray,chu);
	if (is_array(blo)) {
		for (var i = 0; i < array_length(blo); i++) {
			array_push(blockArray,blo[i]);
		}
	}	
}

function world_gen(pos,size,seed) {
	
	//if (1 = 2) {
	//	var arr = array_create(1);
	//	var maxheight = (size.y) / 2;
	//	for (var i = pos.x; i < size.x / BS; i++) {
	//		var xx = i * BS;
	//		var h = (PN_1D_perlinNoise(i,seed,.5,16,400,16)*BS)+maxheight;
	//		for (var j = pos.y; j < h; j++) {
	//			var bl;
	//			var yy = size.y - BS - (j*BS);
	//			if (j >= h - 1) {
	//				bl = new block("Grass Block",sBlocksTest,0,1.2,0,new vector2(xx/BS,yy/BS),undefined);
	//			} else if (j >= h - 4) {
	//				bl = new block("Dirt",sBlocksTest,1,1,0,new vector2(xx/BS,yy/BS),undefined);
	//			} else {
	//				bl = new block("Stone",sBlocksTest,4,2.5,1,new vector2(xx/BS,yy/BS),undefined);
	//			}
	//			array_push(arr,bl);
	//		}
	//	}
	//	saveStructs("blocks.ini",arr);
	//}
	
	//that was old gen, here's the new one
	
	var maxheight = size.y / 2
	var posx = (pos * CHUNKSIZE);
	var chunkpos = pos + CHUNKSIZE;
	var arr = array_create(1);
	var bl;
	var siz = size.x / BS;
	for (var i = pos; i < chunkpos; i++) {
		var xx = i * BS;
		var h = (PN_1D_perlinNoise(i,seed,0.5,16,256,16)*BS)+maxheight;
		for (var j = 0; j < h; j++) {
			var yy = (maxheight - BS - (j*BS));
			if (j >= h - 1) {
				bl = blocks[BL.grass].Copy();
				bl.pos = new vector2(xx div BS,yy div BS);
			} else if (j >= h - 4) {
				bl = blocks[BL.dirt].Copy();
				bl.pos = new vector2(xx div BS,yy div BS);
			} else {
				if (j >= h - 12) bl = worldgen_get_ore(xx,yy,0.1);
				else if (j >= h - 24) bl = worldgen_get_ore(xx,yy,0.2);
				else if (j >= h - 48) bl = worldgen_get_ore(xx,yy,0.3);
				else if (j >= h - 60) bl = worldgen_get_ore(xx,yy,0.4);
				else if (j >= h - 72) bl = worldgen_get_ore(xx,yy,0.5);
				else if (j >= h - 84) bl = worldgen_get_ore(xx,yy,0.6);
				else if (j >= h - 96) bl = worldgen_get_ore(xx,yy,0.7);
				else if (j >= h - 108) bl = worldgen_get_ore(xx,yy,0.8);
				else if (j >= h - 120) bl = worldgen_get_ore(xx,yy,0.9);
				else if (j >= h - 132) bl = worldgen_get_ore(xx,yy,1);
				else if (j >= h - 144) bl = worldgen_get_ore(xx,yy,1.1);
				else bl = worldgen_get_ore(xx,yy,1.2);
					
			}
			//} else if (j >= h - 8) {
			//	if (chance(8)) {
			//		bl = worldgen_get_ore(xx,yy)
			//	} else {
			//		bl = blocks[BL.stone].Copy();
			//		bl.pos = new vector2(xx div BS,yy div BS);
			//	}
			//} else if (j >= h - 16) {
			//	if (chance(16)) {
			//		bl = worldgen_get_ore(xx,yy)
			//	} else {
			//		bl = blocks[BL.stone].Copy();
			//		bl.pos = new vector2(xx div BS,yy div BS);
			//	}
			//} else if (j >= h - 32) {
			//	if (chance(24)) {
			//		bl = worldgen_get_ore(xx,yy)
			//	} else {
			//		bl = blocks[BL.stone].Copy();
			//		bl.pos = new vector2(xx div BS,yy div BS);
			//	}
			//} else if (j >= h - 64) {
			//	if (chance(32)) {
			//		bl = worldgen_get_ore(xx,yy)
			//	} else {
			//		bl = blocks[BL.stone].Copy();
			//		bl.pos = new vector2(xx div BS,yy div BS);
			//	}
			//} else {
			//	if (chance(48)) {
			//		bl = worldgen_get_ore(xx,yy)
			//	} else {
			//		bl = blocks[BL.stone].Copy();
			//		bl.pos = new vector2(xx div BS,yy div BS);
			//	}
			//}
			array_push(arr,bl);
			ds_grid_set(blockGrid,xx div BS, abs(yy div BS), bl);
		}
	}
	currentPos += CHUNKSIZE;
	
	if (pos == 0) {
		wr = new world("temp",0,array_create(1));
		rg = new region("r1",0,array_create(1),wr);
		var k;
		k[0] = pos;
		k[1] = chunkpos;
		ch = new chunk(rg,0,k,false);
		bo = arr;
		fill_arrs(wr,rg,ch,bo);
		saveStructs(DEFAULTPATH + "worlds.ini",worldArray);
		saveStructs(DEFAULTPATH + "regions.ini",regionArray);
		saveStructs(DEFAULTPATH + "chunks.ini",chunkArray);
		saveStructs(DEFAULTPATH + "blocks.ini",blockArray);
	} else {
		var k;
		k[0] = pos;
		k[1] = chunkpos;
		ch = new chunk(rg,0,k,false);
		bo = arr;
		fill_arrs(undefined,undefined,ch,bo);
		saveStructs(DEFAULTPATH + "chunks.ini",chunkArray);
		saveStructs(DEFAULTPATH + "blocks.ini",blockArray);
	}
}

function tst_create(){
	//first is position in region, second is size in chunks on a vector2
	//chunk size = 32 blocks
	//region size = 16 chunks (regions are not repeated on y axis, only x)
	//world size = 1024 regions (LMAO)
	
	for (var i = 0; i < finalWorldSize; i++) {
		tst_keep();
	}
}

function tst_keep() {
	world_gen(currentPos,new vector2(CHUNKSIZE , HEIGHT),random_get_seed());
}

function tst_save() {
	array_sort(blockArray,true);
	saveStructs(DEFAULTPATH + "blocks.ini",blockArray);
	saveStructs(DEFAULTPATH + "worlds.ini",worldArray);
	saveStructs(DEFAULTPATH + "regions.ini",regionArray);
	saveStructs(DEFAULTPATH + "chunks.ini",chunkArray);
	saveGrid(DEFAULTPATH + "grid.ini",blockGrid)
	ds_grid_destroy(blockGrid);
	return true;
}

function tst_load(){
	var array = array_create(0);
	instance_destroy(oSolid);
	array = loadStructs("blocks.ini");
	blockArray = loadStructs(DEFAULTPATH + "blocks.ini");
	chunkArray = loadStructs(DEFAULTPATH + "chunks.ini");
	regionArray = loadStructs(DEFAULTPATH + "regions.ini");
	worldArray = loadStructs(DEFAULTPATH + "worlds.ini");
	blockGrid = loadGrid(DEFAULTPATH + "grid.ini",new vector2(finalWorldSize * CHUNKSIZE,HEIGHT));
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	var _vw = camera_get_view_width(view_camera[0]);
	var _vh = camera_get_view_height(view_camera[0]);
	instance_deactivate_layer(layer_get_id("Blocks"));
	instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128,true);
	instance_activate_layer(layer_get_id("Instances"));
	return array;
}

function block_check(x_,y_,mult) {
	var i = 1;
	var f;
	f = (mult*4);
	var col, lis, final;
	col = collision_circle_list(x_,y_,f*BS,oSolid,false,true,lis,true);
	
	//repeat(mult) {
	//	if !(place_empty(x_ + (i*BS),y_,oCol)) f--;
	//	if !(place_empty(x_ + (i*BS),y_,oCol)) f--;
	//	if !(place_empty(x_ + (i*BS),y_,oCol)) f--;
	//	if !(place_empty(x_ + (i*BS),y_,oCol)) f--;
	//	i++;
	//}
	ds_list_destroy(lis);
	return final;
}

function newInput(key1,key2) {
	var key = key1 || key2;
	return bool(key);
}

exception_unhandled_handler(function(ex)
{
	tst_save();
    // Show the error message (for debug purposes only)
    show_message("Game crashed. Please report this. " + ex.longMessage);
	show_debug_message(ex.longMessage);
    return 0;
});

function get_hover() {
	var _mouseX = device_mouse_x_to_gui(0);
	var _mouseY = device_mouse_y_to_gui(0);
	
	return point_in_rectangle(_mouseX,_mouseY,x,y,x + width,y + height);
}

function create_button(_x,_y,_width,_height,_text,_script) {
	var _button = instance_create_layer(_x,_y,"Instances",oButton);
	
	with (_button) {
		width = _width
		height = _height
		text = _text
		scr = _script
	}
	
	return _button;
}