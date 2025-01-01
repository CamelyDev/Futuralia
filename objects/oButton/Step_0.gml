var _hover = get_hover();
var _click = _hover and mouse_check_button_pressed(mb_left);

hover = lerp(hover, _hover, 0.1);
click = lerp(click, _click, 0.2);
y = lerp(y,ystart - _hover * 8, 0.1);

if (_click and scr >= 0) {
	script_execute(scr)
	text_color = c_lime;
	alarm[0] = 90
}