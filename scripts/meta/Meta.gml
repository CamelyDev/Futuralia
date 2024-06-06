//begteam
#macro GMSPD 60

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

function head_state(headSpr,stateIndex,attachPoint,flipValue,rotationValue) constructor {
	_spr = headSpr
	_state = stateIndex
	_attach = attachPoint
	_flip = flipValue
	_rot = rotationValue
}

function item_a(name_item,sprindex,imgindex,extra) constructor {
	name = name_item;
	spr = sprindex;
	img = imgindex;
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
		if extra.tilePlace != undefined {
			ext.tile = extra.tilePlace;
		} 
		if extra.toolDone != undefined {
			ext.tools = extra.toolDone;
		}
	}
	static Copy = function() {
		return new item_a(name,spr,img,extr);
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

function block(name,sprindex,imgindex,resistance,mintool,position,blocktype) constructor {
	nm = name;
	spr = sprindex;
	img = imgindex;
	res = resistance;
	minpow = mintool;
	pos = position;
	bt = blocktype
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
	static Copy = function() {
		return new block(nm,spr,img,res,minpow,pos,bt);
	}
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

function world(name,index,arr) constructor {
	nm = name;
	ind = index;
	regions = arr;
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