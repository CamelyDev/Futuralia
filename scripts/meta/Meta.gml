//begteam
#macro GMSPD 60

function image_id(_sprite,_index) constructor {
	sprite_index = _sprite;
	image_index = _index;
}

function vector2(_x,_y) constructor {
	x = _x;
	y = _y;
}

function snapp(val,amount) {
	return floor(val/amount) * amount;
}

function sort_func(a,b) {
	return a > b;
}

function item_table(tile_to_place,drop_item) constructor {
	til = tile_to_place;
	drp = drop_item;
	
	static Copy = function() {
		return new item_table(til,drp);
	}
}

function block_ore(base_chance = 100,harvest_level = 0,drop_xp = 0) constructor {
	_base_chance = base_chance;
	_harvest_level = harvest_level;
	_drop_xp = drop_xp
}

function tool_table(tool_type,tool_speed,tool_durability,tool_power,tool_place) constructor {
	tl_type = tool_type;
	tl_speed = tool_speed;
	tl_durability = tool_durability;
	tl_power = tool_power;
	tl_place = tool_place;
	
	static Copy = function() {
		return new tool_table(tl_type,tl_speed,tl_durability,tl_power,tl_place);
	}
}

function player_table(score_struct,inventory_struct,player_struct) constructor {
	scr = score_struct;
	inv = inventory_struct;
	plr = player_struct;
	
	static Copy = function() {
		return new player_table(scr,inv,plr);
	}
}

function head_state(headSpr,stateIndex,attachPoint,flipValue,rotationValue) constructor {
	_spr = headSpr
	_state = stateIndex
	_attach = attachPoint
	_flip = flipValue
	_rot = rotationValue
}

function item_a(name_item,sprindex,imgindex,reference) constructor {
	name = name_item;
	spr = sprindex;
	img = imgindex;
	ref = reference;
	static Copy = function() {
		return new item_a(name,spr,img,ref);
	}
}

function ref_item(ref_image,ref_tooltable,ref_itemtable) constructor {
	img = ref_image;
	ttl = ref_tooltable;
	itl = ref_itemtable;
	static Copy = function() {
		return new ref_item(img,ttl,itl);
	}
}

function ref_block(ref_image,ref_blocktable) constructor {
	img = ref_image;
	btl = ref_blocktable;
	static Copy = function() {
		return new ref_block(img,btl);
	}
}

//function item(name,sprindex,imgindex,extra) constructor {
//	nm = name;
//	spr = sprindex;
//	img = imgindex;
//	ext = {
//		func1 : undefined,
//		func2 : undefined,
//		func3 : undefined,
//		func4 : undefined,
//		tile : undefined,
//		tools : undefined,
//		drop : undefined,
//		sol : undefined
//	}
//	extr = extra;
//	if extra != undefined {
//		if extra.function1 != undefined {
//			ext.func1 = extra.function1;
//		} 
//		if extra.function2 != undefined {
//			ext.func2 = extra.function2;
//		} 
//		if extra.function3 != undefined {
//			ext.func3 = extra.function3;
//		} 
//		if extra.function4 != undefined {
//			ext.func4 = extra.function4;
//		} 
//		if extra.tilePlace != undefined {
//			ext.tile = extra.tilePlace;
//		} 
//		if extra.toolDone != undefined {
//			ext.tools = extra.toolDone;
//		}
//	}
//	static Copy = function() {
//		return new item(nm,spr,img,extr);
//	}
//}

function tool(name,toolMode,toolPower,toolSpeed,extra) constructor {
	nm = name;
	mode = toolMode;
	pow = toolPower;
	spd = toolSpeed;
	ext = {
		func1 : undefined,
		func2 : undefined,
		func3 : undefined,
		func4 : undefined,
		tile : undefined,
		tools : undefined,
		drop : undefined,
		sol : undefined
	}
	extr = extra;
	if extra != undefined {
		if extra.function1 != undefined {
			ext.func1 = extra.function1;
		} 
		if extra.function2 != undefined {
			ext.func2 = extra.function2;
		} 
		if extra.function3 != undefined {
			ext.func3 = extra.function3;
		} 
		if extra.function4 != undefined {
			ext.func4 = extra.function4;
		}
	}
	static Copy = function() {
		return new tool(nm,mode,pow,spd,extr);
	}
}

function block(name,sprite_img,imgindex,resistance,position,blocktype,modadding = "futuralia",blockore = new block_ore(100,0,0)) constructor {
	_modid = modadding
	nm = name;
	spr = sprite_img;
	img = imgindex;
	res = resistance;
	pos = position;
	bt = blocktype;
	_blockore = blockore
	//ext = {
	//	func1 : undefined,
	//	func2 : undefined,
	//	func3 : undefined,
	//	func4 : undefined,
	//	tile : undefined,
	//	tools : undefined,
	//	drop : undefined,
	//	sol : undefined
	//}
	//extr = extra;
	//if extra != undefined {
	//	if extra.function1 != undefined {
	//		ext.func1 = extra.function1;
	//	} 
	//	if extra.function2 != undefined {
	//		ext.func2 = extra.function2;
	//	} 
	//	if extra.function3 != undefined {
	//		ext.func3 = extra.function3;
	//	} 
	//	if extra.function4 != undefined {
	//		ext.func4 = extra.function4;
	//	} 
	//	if extra.itemdrop != undefined {
	//		ext.drop = extra.itemdrop;
	//	}
	//	if extra.is_solid != undefined {
	//		ext.sol = extra.is_solid;
	//	}
		
	//}
}

function chunk(reg,pos,arr,foc) constructor {
	regionon = reg;
	position = pos;
	blarr = arr;
	forceLoad = foc;
}

function region(name,index,arr,wrld) constructor {
	nm = name;
	ind = index;
	chunks = arr;
	worldon = wrld;
}

function world(name,index,arr,randseed) constructor {
	nm = name;
	ind = index;
	regions = arr;
	seed = randseed;
}
function arrayHas(array_to_search, value_to_find) {
	var searchArray = array_to_search;
	var findValue = value_to_find;
	var loop = 0;
	repeat (array_length(searchArray)) if (searchArray[++loop] == findValue) return true;
	return false;
}
function arrayFind(arr,val) {
	for (var i = 0; i < array_length(arr); ++i) {
		if (arr[i] == val) {
			return i;
		}
	}
}
function skill(_name,_index) constructor {
	name = _name;
	index = _index;
	static Copy = function() {
		return new skill(name,index);
	}
}
function subskill(_name,_index, _parent, _level) constructor {
	name = _name;
	index = _index;
	parent = _parent;
	level = _level;
	static Copy = function() {
		return new subskill(name, index, parent, level);
	}
}