//begteam
#macro BS 16
#macro WORLDSIZE 16
#macro REGSIZE 16
#macro CHUNKSIZE 48
#macro HEIGHT 128
#macro BLSPRITE asset_get_index("sBlocks")
#macro WLSPRITE asset_get_index("sBlocks")
#macro BASEMOD "futuralia"
#macro MODFORMAT ".frm"
#macro GAMEVER "0.0.2"
#macro DEFAULTPATH ""
#macro MODPATH "future_game/mods/"

function worldgen_parse_mods(array_of_files) {
	_BL = {
		is_loaded: false
	}
	for (var i = 0; i < array_length(array_of_files); i++) {
		show_debug_message("Loading mod number " + string(i) + ", name " + array_of_files[i])
		_mod_name = array_of_files[i];
		_mod_zip = MODPATH + _mod_name + "/" + _mod_name + ".zip"
		if (file_exists(_mod_zip)) {
			var _zip = zip_unzip(_mod_zip,MODPATH + _mod_name + "/")
			if (_zip <= 0) {
				throw ("Cannot extract mod file " + _mod_zip + ". Please contact the developer of the mod or try again later.")
			} else {
				show_debug_message("Extracted mod file " + _mod_zip + " succesfully. Now loading...")
			}
		}
		_mod_fn = MODPATH + _mod_name + "/" + array_of_files[i] + MODFORMAT;
		_mod = file_text_open_read(_mod_fn);
		//show_debug_message(_mod)
		_mod_json = file_text_read_string(_mod)
		//show_debug_message(_mod_json)
		_mod_parsed = json_parse(_mod_json);
		//show_debug_message(_mod_parsed)
		struct_set(_BL,_mod_name,_mod_parsed);
		
		
		var _str1 = variable_struct_get(_BL,_mod_name)
		var _str = variable_struct_get(_str1,"fixed");
		//sprite_add(MODPATH + _mod_name + "/" + nm + ".png",1,false,false,0,0)
		//_str[$ _current_loop].nm + ".png";
		//sprite_add(MODPATH + _mod_name + "/" + _str[$ _current_loop].nm + ".png";,1,false,false,0,0)
		var _loop = variable_struct_get_names(_str);
		var _loop_length = array_length(_loop);
		
		for (var j = 0; j < _loop_length; j++) {
			var _current_loop = _loop[j];
			var _fn = MODPATH + _mod_name + "/" + _str[$ _current_loop].nm + ".png"
			if (_str[$ _current_loop].spr == "") {
				_str[$ _current_loop].spr = sprite_add(_fn,1,false,false,0,0)
			}
		}
		//_mod = file_text_open_read(MODPATH + _mod_name + "/" + array_of_files[i]);
		////show_debug_message(_mod)
		//_mod_json = file_text_read_string(_mod)
		////show_debug_message(_mod_json)
		//_mod_parsed = json_parse(_mod_json);
		////show_debug_message(_mod_parsed)
		//struct_set(_BL,_mod_name,_mod_parsed);
	}
	_BL.is_loaded = true;
	return _BL;
}

function worldgen_move_files() {
	if (file_exists("futuralia.zip") and !directory_exists(MODPATH + "futuralia")) {
		show_debug_message("Init move files")
		file_copy("futuralia.zip",MODPATH + "futuralia/futuralia.zip")
	}
}

function worldgen_list_mods(directory) {
	var ds_folders, folder, _array;
	ds_folders = ds_list_create();
	_array = array_create(0);

	folder = file_find_first(MODPATH + "*", fa_directory);
	while(folder != "") {
		if(directory_exists(directory)) {
			ds_list_add(ds_folders, folder);
		}
		folder = file_find_next();
	}

	for(var index = 0; index < ds_list_size(ds_folders); index++) {
		show_debug_message(ds_folders[| index]);
		array_push(_array,ds_folders[| index]);
	}
	
	ds_list_destroy(ds_folders);
	
	file_find_close();
	
	return _array;
}

function worldgen_define_chances_ores(blocks_struct) {
	struct_foreach(blocks_struct,function(_name, _value) {
		if (is_struct(_value)) {
			struct_foreach(struct_get(_value,"fixed"),function(__name,__value) {
				if (is_struct(__value)) {
					if (is_struct(__value._blockore)) {
						var bohl = __value._blockore._harvest_level;
						if (bohl > 0) {
							array_push(CHANCES,[__value._blockore._base_chance, __value]);
							//show_debug_message("Pushed base chance: " + string(__value._blockore._base_chance) + " for block name: " + __value.nm);
						} else {
							show_debug_message("Not enough harvest level to be scored for block name: " + __value.nm)
						}
					} else {
						show_debug_message("No chances defined for block name: " + __value.nm)
					}
				} else {
					show_debug_message("Not a block for index name: " + __name)
				}
			});
		} else {
			show_debug_message("Not a mod struct for mod name: " + _name)
		}
	});
	//TODO finish this function to define ore chances
	//loop through all of the blocks with >0 harvest level
	//store all of the chances of them in an array
	//order the blocks by rarity, and add a reference to them in the array
	//return the array to put in a global var
}

function worldgen_init() {
	worldgen_move_files()
	//enum BL {
	//	grass,
	//	dirt,
	//	stone,
	//	brick,
	//	quartz,
	//	emerald,
	//	citrine,
	//	diamond,
	//	amethyst,
	//	onyx,
	//	ruby,
	//	sapphire,
	//	jasper,
	//	tigerseye,
	//	sugilite,
	//	woodplanks,
	//	woodslabup,
	//	woodslabdown,
	//	woodslableft,
	//	woodslabright,
	//	woodwall,
	//	woodchairleft,
	//	woodchairright,
	//	woodtable
	//}
	
	//worldgen_fixed()
	
	enum IT {
		pickaxe,
		dirt,
		grass,
		stone,
		brick,
		woodplanks,
		woodslab,
		woodwall,
		woodchair,
		woodtable
	}
	enum TM {
		pick,
		ax,
		hoe,
		shovel
	}
	globalvar worldArray, regionArray, chunkArray, blockArray, currentPos, blocks, items, spriteBlocks, BLGLOBAL, CHANCES;
	//blockGrid = ds_grid_create(finalWorldSize * CHUNKSIZE,HEIGHT);
	regionArray = array_create(1);
	chunkArray = array_create(1);
	blockArray = array_create(1);
	worldArray = array_create(1);
	currentPos = 0;
	blocks = array_create(4);
	var mods = worldgen_list_mods(MODPATH);
	BLGLOBAL = worldgen_parse_mods(mods);
	show_debug_message(BLGLOBAL)
	items = array_create(10);
	CHANCES = array_create(0)
	//array_pop(CHANCES);
	worldgen_define_chances_ores(BLGLOBAL)
}

function worldgen_save_mod(_mod, _mod_name = "futuralia") {
	_bl = {
		fixed: _mod
	}
	
	show_debug_message("Mod saving init")
	_bl_text = json_stringify(_bl,false);
	show_debug_message("Stringified")
	_file = file_text_open_write(MODPATH + _mod_name + "/" + _mod_name + ".frm");
	show_debug_message("Opened file")
	file_text_write_string(_file,_bl_text);
	show_debug_message("Wrote to file")
	file_text_close(_file);
	show_debug_message("Closed file")
}

function worldgen_oredlc() {
	mo_ores = {
		
	}
	show_debug_message("Block struct init")
	//Egg Ore, 0.45 resistance, 1/7 chance, 5 harvest level, 500 xp
	struct_set(mo_ores,"egg_ore",new block("Egg Ore","",0,0.45,new vector2(0,0),BT.SOLID,"mo_ores",new block_ore(1/7,32,512)))
	
	worldgen_save_mod(mo_ores,"mo_ores");
}

function worldgen_basegame() {
	futuralia = {
		
	}
	show_debug_message("Block struct init")
	
	//blocks[BL.grass] = new block("Grass Block",TT.blocks_main,0,2.3,new vector2(0,0),BT.SOLID);
	struct_set(futuralia,"grass_block",new block("Grass Block","",0,2.3,new vector2(0,0),BT.SOLID,"futuralia"))
	show_debug_message("First block")
	//blocks[BL.dirt] = new block("Dirt",TT.blocks_main,1,2.4,new vector2(0,0),BT.SOLID);
	struct_set(futuralia,"dirt",new block("Dirt","",1,2.4,new vector2(0,0),BT.SOLID,"futuralia"));
	//blocks[BL.stone] = new block("Stone",TT.blocks_main,2,1.6,new vector2(0,0),BT.SOLID)
	struct_set(futuralia,"stone",new block("Stone","",2,1.6,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(100,0,2)));
	//blocks[BL.brick] = new block("Bricks",TT.blocks_main,3,2.2,new vector2(0,0),BT.SOLID)
	struct_set(futuralia,"brick",new block("Bricks","",3,2.2,new vector2(0,0),BT.SOLID,"futuralia"));
	//blocks[BL.woodplanks] = new block("Wood Planks",TT.blocks_main,15,2,new vector2(0,0),BT.SOLID,4))
	struct_set(futuralia,"wood_planks",new block("Wood Planks","",15,2,new vector2(0,0),BT.SOLID,"futuralia"));
	//blocks[BL.woodslabup] = new block("Wood Slab (Up)",TT.blocks_main,16,2,new vector2(0,0),BT.SLABUP,5))
	struct_set(futuralia,"wood_slab_up",new block("Wood Slab (Up)","",16,2,new vector2(0,0),BT.SLABUP,"futuralia"))
	//blocks[BL.woodslabdown] = new block("Wood Slab (Down)",TT.blocks_main,17,2,new vector2(0,0),BT.SLABDOWN,6))
	struct_set(futuralia,"wood_slab_down",new block("Wood Slab (Down)","",17,2,new vector2(0,0),BT.SLABDOWN,"futuralia"))
	//blocks[BL.woodslableft] = new block("Wood Slab (Left)",TT.blocks_main,18,2,new vector2(0,0),BT.SLABLEFT,7))
	struct_set(futuralia,"wood_slab_left",new block("Wood Slab (Left)","",18,2,new vector2(0,0),BT.SLABLEFT,"futuralia"))
	//blocks[BL.woodslabright] = new block("Wood Slab (Right)",TT.blocks_main,19,2,new vector2(0,0),BT.SLABRIGHT,8))
	struct_set(futuralia,"wood_slab_right",new block("Wood Slab (Right)","",19,2,new vector2(0,0),BT.SLABRIGHT,"futuralia"))
	//blocks[BL.woodwall] = new block("Wood Wall",TT.walls_main,20,2.6,new vector2(0,0),BT.PASSABLE,9))
	struct_set(futuralia,"wood_wall",new block("Wood Wall","",20,2.6,new vector2(0,0),BT.PASSABLE,"futuralia"))
	//blocks[BL.woodchairleft] = new block("Wood Chair (Left)",TT.background_main,21,2.5,new vector2(0,0),BT.PASSABLE,10))
	struct_set(futuralia,"wood_chair_left",new block("Wood Chair (Left)","",21,2.5,new vector2(0,0),BT.PASSABLE,"futuralia"))
	//blocks[BL.woodchairright] = new block("Wood Chair (Right)",TT.background_main,22,2.5,new vector2(0,0),BT.PASSABLE,11))
	struct_set(futuralia,"wood_chair_right",new block("Wood Chair (Right)","",22,2.5,new vector2(0,0),BT.PASSABLE,"futuralia"))
	//blocks[BL.woodtable] = new block("Wood Table",TT.background_main,23,2.3,new vector2(0,0),BT.PASSABLE,12))
	struct_set(futuralia,"wood_table",new block("Wood Table","",23,2.3,new vector2(0,0),BT.PASSABLE,"futuralia"))
	//blocks[BL.quartz] = new block("Quartz",TT.blocks_main,4,1.5,new vector2(0,0),BT.SOLID,13));}
	/*
	chanceArray = [
		100, stone
		22*mult, quartz
		21*mult, emerald
		18*mult, citrine
		17*mult, diamond
		15*mult, amethyst
		13*mult, onyx
		9*mult, ruby
		5*mult, sapphire
		3*mult, jasper
		1*mult, tigers_eye
		1/5*mult sugilite
	]
	*/
	show_debug_message("Ore blocks init")
	struct_set(futuralia,"quartz",new block("Quartz","",4,1.5,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(22,2,10)));
	//blocks[BL.emerald] = new block("Emerald",TT.blocks_main,5,1.4,new vector2(0,0),BT.SOLID,14);
	struct_set(futuralia,"emerald",new block("Emerald","",5,1.4,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(21,2,12)));
	//blocks[BL.citrine] = new block("Citrine",TT.blocks_main,6,1.3,new vector2(0,0),BT.SOLID,15);
	struct_set(futuralia,"citrine",new block("Citrine","",6,1.3,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(18,3,18)));
	//blocks[BL.diamond] = new block("Diamond",TT.blocks_main,7,1.2,new vector2(0,0),BT.SOLID,16);
	struct_set(futuralia,"diamond",new block("Diamond","",7,1.2,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(17,3,20)));
	//blocks[BL.amethyst] = new block("Amethyst",TT.blocks_main,8,1.1,new vector2(0,0),BT.SOLID,17);
	struct_set(futuralia,"amethyst",new block("Amethyst","",8,1.1,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(15,4,24)));
	//blocks[BL.onyx] = new block("Onyx",TT.blocks_main,9,1.0,new vector2(0,0),BT.SOLID,18);
	struct_set(futuralia,"onyx",new block("Onyx","",9,1.0,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(13,5,32)));
	//blocks[BL.ruby] = new block("Ruby",TT.blocks_main,10,0.9,new vector2(0,0),BT.SOLID,19);
	struct_set(futuralia,"ruby", new block("Ruby","",10,0.9,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(9,6,44)));
	//blocks[BL.sapphire] = new block("Sapphire",TT.blocks_main,11,0.8,new vector2(0,0),BT.SOLID,20));
	struct_set(futuralia,"sapphire", new block("Sapphire","",11,0.8,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(5,8,72)));
	//blocks[BL.jasper] = new block("Jasper",TT.blocks_main,12,0.7,new vector2(0,0),BT.SOLID,21));
	struct_set(futuralia,"jasper",new block("Jasper","",12,0.7,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(3,11,112)));
	//blocks[BL.tigerseye] = new block("Tiger's Eye",TT.blocks_main,13,0.6,new vector2(0,0),BT.SOLID,22));
	struct_set(futuralia,"tigers_eye",new block("Tiger's Eye","",13,0.6,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(1,14,144)));
	//blocks[BL.sugilite] = new block("Sugilite",TT.blocks_main,14,0.5,new vector2(0,0),BT.SOLID,23));
	struct_set(futuralia,"sugilite",new block("Sugilite","",14,0.5,new vector2(0,0),BT.SOLID,"futuralia",new block_ore(1/5,16,256)));
	
	//_bl = {
	//	fixed: futuralia
	//}
	
	//show_debug_message("All blocks added")
	//_bl_text = json_stringify(_bl,false);
	//show_debug_message("Stringified")
	//_file = file_text_open_write(MODPATH + "futuralia/" + BLJSON);
	//show_debug_message("Opened file")
	//file_text_write_string(_file,_bl_text);
	//show_debug_message("Wrote to file")
	//file_text_close(_file);
	//show_debug_message("Closed file")
	
	worldgen_save_mod(futuralia,"futuralia")
}

function chanceCustom(mult) {
	var rand = random(100);
	var finalRarity = -1;
	
	for (var i = 0; i < array_length(CHANCES); i++) {
		if (rand <= CHANCES[i][0] * mult) {
			finalRarity = CHANCES[i][1];
		}
		//else {
		//	break;
		//}
	}
	
	return finalRarity;
}

function worldgen_get_ore(xx,yy,mult) {
	//check each block-chance
	//if gen-chance is less or equal than block-chance set block copy
	//do that until there is no block ores left
	var chanceResult, bl, _bl, oldseed;
	//randomize()
	chanceResult = chanceCustom(mult);
	bl = chanceResult;
	//show_debug_message(chanceResult);
	//switch(chanceResult) {
	//	case 0: {
	//		//stone
	//		bl = BLGLOBAL.futuralia.fixed.stone
	//	} break;
		
	//	case 1: {
	//		//quartz
	//		bl = BLGLOBAL.futuralia.fixed.quartz
	//	} break;
		
	//	case 2: {
	//		//emerald
	//		bl = BLGLOBAL.futuralia.fixed.emerald
	//	} break;
		
	//	case 3: {
	//		//citrine
	//		bl = BLGLOBAL.futuralia.fixed.citrine
	//	} break;
		
	//	case 4: {
	//		//diamond
	//		bl = BLGLOBAL.futuralia.fixed.diamond
	//	} break;
		
	//	case 5: {
	//		//amethyst
	//		bl = BLGLOBAL.futuralia.fixed.amethyst
	//	} break;
		
	//	case 6: {
	//		//onyx
	//		bl = BLGLOBAL.futuralia.fixed.onyx
	//	} break;
		
	//	case 7: {
	//		//ruby
	//		bl = BLGLOBAL.futuralia.fixed.ruby
	//	} break;
		
	//	case 8: {
	//		//sapphire
	//		bl = BLGLOBAL.futuralia.fixed.sapphire
	//	} break;
		
	//	case 9: {
	//		//jasper
	//		bl = BLGLOBAL.futuralia.fixed.jasper
	//	} break;
		
	//	case 10: {
	//		//tigerseye
	//		bl = BLGLOBAL.futuralia.fixed.tigers_eye
	//	} break;
		
	//	case 11: {
	//		//sugilite
	//		bl = BLGLOBAL.futuralia.fixed.sugilite
	//	} break;
	//}
	//show_debug_message(bl)
	if (bl != -1) {
		_bl = variable_clone(bl)
	} else {
		_bl = variable_clone(BLGLOBAL.futuralia.fixed.stone);
	}
	//show_debug_message(_bl)
	if (_bl != -1) {
		_bl.pos = new vector2(xx div BS,yy div BS);
	}
	return _bl;
}

function chance(perc){
	var rand = irandom(100);
	return rand < perc ? true : false;
}

function chanceint(perc){
	var rand = irandom(100);
	return rand < perc ? 1 : 0;
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
	//ds_grid_set(blockGrid,bl.pos.x div BS, abs(bl.pos.y div BS),bl);
	var inst;
	var _x, _y;
	_x = bl.pos.x*BS;
	_y = bl.pos.y*BS;
	var _check = collision_rectangle(_x,_y,_x+(BS-1),_y+(BS-1),oSolid,true,true);
	if (_check == noone) {
		inst = instance_create_layer(_x,_y,"Blocks",oSolid);
	} else {
		inst = _check;
		inst.index = 0;
	}
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
	//var caveArray = cave_gen(68,seed);
	// TODO: CAVE GEN
	var noise_value = new FastNoiseLite(seed);
	noise_value.SetNoiseType(FastNoiseLite.NoiseType.Perlin);
	noise_value.SetFractalOctaves(16);
	noise_value.SetFrequency(0.04)
	var maxheight = size.y
	var posx = (pos * CHUNKSIZE);
	var chunkpos = pos + CHUNKSIZE;
	var arr = array_create(1);
	var bl = 0;
	var siz = size.x / BS;
	for (var i = pos; i < chunkpos; i++) {
		var xx = i * BS;
		//var h = (PN_1D_perlinNoise(i,seed,0.5,16,256,16)*BS)+maxheight;
		var h = (noise_value.GetNoise(i,0)*BS)+maxheight;
		for (var j = 0; j < h; j++) {
			var yy = ((maxheight*1.6)*BS) - (j*BS);
			if (j >= h - 1) {
				bl = variable_clone(BLGLOBAL.futuralia.fixed.grass_block)
				bl.pos = new vector2(xx div BS,yy div BS);
			} else if (j >= h - 4) {
				bl = variable_clone(BLGLOBAL.futuralia.fixed.dirt)
				bl.pos = new vector2(xx div BS,yy div BS);
			} else {
				if (j >= h - 12) bl = worldgen_get_ore(xx,yy,0.05);
				else if (j >= h - 24) bl = worldgen_get_ore(xx,yy,0.1);
				else if (j >= h - 48) bl = worldgen_get_ore(xx,yy,0.17);
				else if (j >= h - 60) bl = worldgen_get_ore(xx,yy,0.23);
				else if (j >= h - 72) bl = worldgen_get_ore(xx,yy,0.45);
				else if (j >= h - 84) bl = worldgen_get_ore(xx,yy,0.61);
				else if (j >= h - 96) bl = worldgen_get_ore(xx,yy,0.73);
				else if (j >= h - 108) bl = worldgen_get_ore(xx,yy,0.89);
				else if (j >= h - 120) bl = worldgen_get_ore(xx,yy,1);
				else if (j >= h - 132) bl = worldgen_get_ore(xx,yy,1.12);
				else if (j >= h - 144) bl = worldgen_get_ore(xx,yy,1.495);
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
			//ds_grid_set(blockGrid,xx div BS, abs(yy div BS), bl);
		}
	}
	currentPos += CHUNKSIZE;
	if (pos == 0) {
		wr = new world("test",0,array_create(1),random_get_seed());
		rg = new region("r1",0,array_create(1),wr);
		var k;
		k[0] = pos;
		k[1] = chunkpos;
		ch = new chunk(rg,0,k,false);
		bo = arr;
		fill_arrs(wr,rg,ch,bo);
		//saveStructs(DEFAULTPATH + "worlds.ini",worldArray);
		//saveStructs(DEFAULTPATH + "regions.ini",regionArray);
		//saveStructs(DEFAULTPATH + "chunks.ini",chunkArray);
		//saveStructs(DEFAULTPATH + "blocks.ini",blockArray);
	} else {
		var k;
		k[0] = pos;
		k[1] = chunkpos;
		ch = new chunk(rg,0,k,false);
		bo = arr;
		fill_arrs(undefined,undefined,ch,bo);
		//saveStructs(DEFAULTPATH + "chunks.ini",chunkArray);
		//saveStructs(DEFAULTPATH + "blocks.ini",blockArray);
	}
}

function cave_gen(fillPercent,seed) {
	var caveArray;
	caveArray[0,0] = 0;
}

function tst_create(){
	//first is position in region, second is size in chunks on a vector2
	//chunk size = 32 blocks
	//region size = 16 chunks (regions are not repeated on y axis, only x)
	//world size = 1024 regions (LMAO)
	
	for (var i = 0; i < finalWorldSize; i++) {
		tst_keep();
	}
	
	tst_save();
}

function tst_keep() {
	world_gen(currentPos,new vector2(CHUNKSIZE , HEIGHT),random_get_seed());
	CameraClean()
}

function tst_save() {
	//array_sort(blockArray,true);
	/*
	xp = 0;
	show_xp = 0;
	rest_xp = 0;
	strength = 0;
	strength_bonus = 1;
	rebirths = 0;
	strength_to_rebirth = 32;
	*/
	var playerData = {
		xp: oPlayer2.xp,
		show_xp: oPlayer2.show_xp,
		strength: oPlayer2.strength,
		rebirths: oPlayer2.rebirths,
		strength_to_rebirth: oPlayer2.strength_to_rebirth
	}
	var playerJson = json_stringify(playerData);
	show_debug_message(playerJson)
	//make buffer
	var buff1 = buffer_create(768,buffer_grow,1);
	buffer_seek(buff1,buffer_seek_start,0)
	buffer_write(buff1,buffer_string,playerJson);
	var compbuff1 = buffer_compress(buff1,0,buffer_tell(buff1));
	//saveStructs(DEFAULTPATH + "blocks.ini",blockArray);
	buffer_save(compbuff1,DEFAULTPATH + "playerData.sav");
	buffer_delete(compbuff1);
	buffer_delete(buff1);
	
	//make buffer
	var buff = buffer_create(finalWorldSize*CHUNKSIZE,buffer_grow,1);
	buffer_seek(buff,buffer_seek_start,0)
	buffer_write(buff,buffer_string,json_stringify(blockArray));
	var compbuff = buffer_compress(buff,0,buffer_tell(buff));
	//saveStructs(DEFAULTPATH + "blocks.ini",blockArray);
	buffer_save(compbuff,DEFAULTPATH + "blocks.sav");
	buffer_delete(compbuff);
	buffer_delete(buff);
	//saveStructs(DEFAULTPATH + "blocks.ini", blockArray);
	saveStructs(DEFAULTPATH + "worlds.ini",worldArray);
	saveStructs(DEFAULTPATH + "regions.ini",regionArray);
	saveStructs(DEFAULTPATH + "chunks.ini",chunkArray);
	//saveGrid(DEFAULTPATH + "grid.ini",blockGrid)
	return true;
}

function tst_load(){
	var array = array_create(0);
	instance_destroy(oSolid);
	//load the buffer
	var buff = buffer_load(DEFAULTPATH + "blocks.sav");
	var decompbuff = buffer_decompress(buff)
	var str = buffer_read(decompbuff,buffer_string);
	array = json_parse(str);
	
	var buff1 = buffer_load(DEFAULTPATH + "playerData.sav");
	var decompbuff1 = buffer_decompress(buff1)
	var str1 = buffer_read(decompbuff1,buffer_string);
	var playerData = json_parse(str1);
	show_debug_message(playerData)
	
	blockArray = array;
	chunkArray = loadStructs(DEFAULTPATH + "chunks.ini");
	regionArray = loadStructs(DEFAULTPATH + "regions.ini");
	worldArray = loadStructs(DEFAULTPATH + "worlds.ini");
	//blockGrid = loadGrid(DEFAULTPATH + "grid.ini",new vector2(finalWorldSize * CHUNKSIZE,HEIGHT));
	//var _vx = camera_get_view_x(view_camera[0]);
	//var _vy = camera_get_view_y(view_camera[0]);
	//var _vw = camera_get_view_width(view_camera[0]);
	//var _vh = camera_get_view_height(view_camera[0]);
	//instance_deactivate_layer(layer_get_id("Blocks"));
	//instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128,true);
	//instance_activate_layer(layer_get_id("Instances"));
	CameraClean()
	//return array;
	
	return playerData;
}

//function block_check(x_,y_,mult) {
//	var i = 1;
//	var f;
//	f = (mult*4);
//	var col, lis, final;
//	col = collision_circle_list(x_,y_,f*BS,oSolid,false,true,lis,true);
	
//	//repeat(mult) {
//	//	if !(place_empty(x_ + (i*BS),y_,oCol)) f--;
//	//	if !(place_empty(x_ + (i*BS),y_,oCol)) f--;
//	//	if !(place_empty(x_ + (i*BS),y_,oCol)) f--;
//	//	if !(place_empty(x_ + (i*BS),y_,oCol)) f--;
//	//	i++;
//	//}
//	ds_list_destroy(lis);
//	return final;
//}

function newInput(key1,key2) {
	var key = key1 || key2;
	return bool(key);
}

exception_unhandled_handler(function(ex)
{
	tst_save();
    // Show the error message (for debug purposes only)
    //show_message("Game crashed. Please report this. " + ex.longMessage);
	//yeah the game crashes fuck you im not playing it -1000 social credit
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

function ws_tiny() {
	oSettings.subselector[ST.size] = WS.tiny;
}

function ws_medium() {
	oSettings.subselector[ST.size] = WS.medium;
}

function ws_large() {
	oSettings.subselector[ST.size] = WS.large;
}

function ws_giant() {
	oSettings.subselector[ST.size] = WS.giant;
}

function ws_extreme() {
	oSettings.subselector[ST.size] = WS.extreme;
}

function st_load() {
	with (oSettings) event_user(0);
}

function st_create() {
	with (oSettings) event_user(1);
}

//why so serious?

function CameraClean() {
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	var _vw = camera_get_view_width(view_camera[0]);
	var _vh = camera_get_view_height(view_camera[0]);
	instance_deactivate_layer(layer_get_id("Blocks"));
	instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128,true);
	instance_activate_layer(layer_get_id("Instances"));
}

//function GetBlockAtPos_Cam(_x,_y) {
//	var _vx = camera_get_view_x(view_camera[0]);
//	var _vy = camera_get_view_y(view_camera[0]);
//	var _vw = camera_get_view_width(view_camera[0]);
//	var _vh = camera_get_view_height(view_camera[0]);
//	for (var i = _vx div BS; i < _vw div BS; i++) {
		
//	}
//}

function instance_exists_position(_x,_y,_instance) {
	var i, check, instNum;
	
	var _vx = main_cam.x;
	var _vy = main_cam.y;
	var _vw = main_cam.width;
	var _vh = main_cam.height;
	
	check=false;
	instNum = instance_number(_instance);
	
	for (i=0;i<instNum && check==false ; i++) {
			var inst = instance_find(_instance,i);
		
			if (inst.x==_x && inst.y==_y) {
				check=true;
				break;
			}
	}

	return check;
}

function collision_check(_x,_y,obj) {
	var _inst, useful;
	//useful = obj;
	//_inst = tilemap_get_at_pixel(tilemap_solids,_x,_y);
	//if (_inst != 0) and (_inst != -1) and (_inst != 21) {
	//	return true;
	//}
	//return false;
	_inst = instance_place(_x,_y,obj)
	with _inst return isCollision;
	//with (_inst) {
	//	return isCollision;
	//}
	//wat the fuck
}

//function four_way_check(_x,_y,_hor,_ver) {
//	var _inst, _bbox_hor, _bbox_ver;
//	switch(_hor) {
//		case -1: _bbox = bbox_left;
//		case 1: _bbox = bbox_right;
//	}
//	switch(_ver) {
		
//		case 1: _bbox = bbox_right;
//	}
// help fuck fuck help i cant !!! ! !! !! fuckfuckfujhcvgthjktgrhdx
//}

function block_check(_x,_y) {
	if (tilemap_get_at_pixel(tilemap_blocks,_x,_y) == 0) return true;
	//no background tilemap, that one is a fucking dumb ass bitch
	//wh do i still have these fuckass functions omg
	return false;
}

function block_check_return(_x,_y) {
	var t1, t2, t3;
	t1 = tilemap_get_at_pixel(tilemap_blocks,_x,_y)
	t2 = tilemap_get_at_pixel(tilemap_background,_x,_y)
	t3 = tilemap_get_at_pixel(tilemap_walls,_x,_y)
	if t1 != 0 return t1;
	if t2 != 0 return t2;
	if t3 != 0 return t3;
	return 0;
	//no background tilemap, that one is a fucking dumb ass bitch
	//why the fuck did i put that 2 times i didnt mean to
}

function block_set_empty(_x,_y) {
	var t1, t2, t3;
	t1 = tilemap_get_at_pixel(tilemap_blocks,_x,_y)
	t2 = tilemap_get_at_pixel(tilemap_background,_x,_y)
	t3 = tilemap_get_at_pixel(tilemap_walls,_x,_y)
	if t1 != 0 {
		tilemap_set_at_pixel(tilemap_blocks,0,_x,_y);
		return true;
	}
	if t2 != 0 {
		tilemap_set_at_pixel(tilemap_background,0,_x,_y);
		return true;
	}
	if t3 != 0 {
		tilemap_set_at_pixel(tilemap_walls,0,_x,_y);
		return true;
	}
	return false;
}
//function plr_move(_hsp,_vsp) {
//what the fuck was this function even supposed to be
//}

function blockarray_get(_x,_y) {
	
}

function blocklight_draw() {
	//i have no idea how this fucking works LMFAO
	var _x   = argument[0], // X Position
	    _y   = argument[1], // Y Position
	    _r   = argument[2], // Radius
	    _d   = argument[3], // Glow Distance (Outwards)
	    _c1  = argument[4], // Inner Color
	    _c2  = argument[5], // Outer Color
	    _a1  = argument[6], // Inner Alpha
	    _a2  = argument[7], // Outer Alpha
	    _q   = 64,          // Quality (Amount of segments)
	    _dir = 0;           // Direction (For drawing the circle)

	draw_primitive_begin(pr_trianglefan);
	draw_vertex_color(_x,_y, _c1, _a1);

	repeat (_q + 1)
	{
	    draw_vertex_color(_x + lengthdir_x(_r, _dir),_y + lengthdir_y(_r, _dir), _c1, _a1);
	    _dir += 360 / _q;
	}

	draw_primitive_end();

	draw_primitive_begin(pr_trianglestrip);

	repeat (_q + 1)
	{
	    draw_vertex_color(_x + lengthdir_x(_r, _dir),     _y + lengthdir_y(_r, _dir),      _c1, _a1);
	    draw_vertex_color(_x + lengthdir_x(_r + _d, _dir),_y + lengthdir_y(_r + _d, _dir), _c2, _a2);
	    _dir += 360 / _q;
	}

	draw_primitive_end();
}

//function light_draw_begin() {
//	if (event_type == ev_draw) and (event_number == 0) {
//		if (!surface_exists(oTest.light_surface)) oTest.light_surface = surface_create(finalWorldSize*CHUNKSIZE*BS,HEIGHT*BS);
//		surface_set_target(oTest.light_surface);
//		draw_clear_alpha(c_black,1.0);
//		gpu_set_blendmode(bm_add);
//	}
//}
//function light_draw_end() {
//	if (event_type == ev_draw) and (event_number == 0) {
//		surface_reset_target();
//		gpu_set_blendmode_ext(bm_dest_color,bm_zero);
//			main_cam.draw_surf(oTest.light_surface, 0, 0);
//		gpu_set_blendmode(bm_normal);
//	}
//}

//function draw_lights() {
	//STOP MAKING FUNCTIONS THAT YOU WONT USE FUCKER
//}

function block_check_point(_x,_y) {
	var _inst = collision_rectangle(_x,_y,_x+BS,_y+BS,oSolid,false,true)
	if (instance_exists(_inst)) {
		return _inst
	} else return noone
}

function sprite_broadcast(message_type,callback) {
	if (event_data[? "event_type"] == "sprite event") {
		if (event_data[? "message"] == message_type) {
			callback();
		}
	}
}