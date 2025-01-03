var _hover = get_hover();
var _click = _hover and mouse_check_button_pressed(mb_left);

hover = lerp(hover, _hover, 0.1);
click = lerp(click, _click, 0.2);
y = lerp(y,ystart - _hover * 8, 0.1);

if (_click and scr >= 0) {
	var _state = scr()
	with (oButton) {
		if (group == other.group) text_color = c_black;
	}
	if (_state == true) {
		text_color = c_lime;
	} else {
		text_color = c_red;
	}
}