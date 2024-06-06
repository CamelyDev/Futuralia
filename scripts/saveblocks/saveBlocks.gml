//begteam
function saveStructs() {
	var p = 0;
	var fna = file_text_open_write(argument[0]);
	for (var i = 1; i < argument_count; ++i) {
		var j = json_stringify(argument[i]);
		var k = i;
		file_text_write_string(fna,j);
		file_text_writeln(fna);
		p++;
	}
	file_text_close(fna);
	ini_open(argument[0] + ".meta");
	ini_write_real("Index","ind",p);
	ini_close();
}

function loadStructs() {
	if (file_exists(argument[0])) {
		ini_open(argument[0] + ".meta");
		var p = ini_read_real("Index","ind",0);
		ini_close();
		var fna = file_text_open_read(argument[0]);
		var arr = array_create(1);
		if (is_array(arr)) {
			//for (var i = 0; i < p; i++) {
			//	var par = file_text_read_string(fna);
			//	var txt = json_parse(par);
			//	array_push(arr,txt);
			//	file_text_readln(fna);
			//}
			var par = file_text_read_string(fna);
			var txt = json_parse(par);
			return txt;
		}
	}
}

function saveGrid(filename,grid) {
	var fna = file_text_open_write(filename);
	file_text_write_string(fna,ds_grid_write(grid));
	file_text_close(fna);
}

function loadGrid(filename,size) {
	var fna = file_text_open_read(filename);
	var par = file_text_read_string(fna)
	var gr = ds_grid_create(size.x,size.y);
	ds_grid_read(gr,par);
	file_text_close(fna);
	return gr;
}