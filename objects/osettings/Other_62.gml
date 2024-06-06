//begteam

if ds_map_find_value(async_load, "id") == sprr
{
    var status = ds_map_find_value(async_load, "status");
    if status == 0
    {
		show_debug_message(status);
		var path = ds_map_find_value(async_load, "result");
		spriteArray[0] = sBlocksTest;
		//sprite_add(path,BLOCKSTRIP+1,false,false,0,0);
		alarm[1] = 10;
    }
}