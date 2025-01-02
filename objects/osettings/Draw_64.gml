//begteam

//draw_set_font(fnt2);
//draw_set_color(c_red);
//draw_set_halign(fa_center);
//draw_text(684,32,"FUTURALIA.");
//draw_text(684,128,"Select world size.");
//draw_text(684,456,"Select world slot.");
//draw_text(684,608,"World Slot " + string(worldSlot) + " selected.");

draw_set_font(fnt2);
draw_set_color(c_maroon);
draw_set_halign(fa_center);
draw_text(684,32,"FUTURALIA.");
draw_text(684,128,"Select world size.\nLarge+ worlds may take a long time to load.\nThey may use a lot of CPU, too.");
draw_text(684,456,"Select world slot.");
draw_text(684,608,"World Slot " + string(worldSlot) + " selected.");

//switch(subselected) {
//	default:
//		draw_set_color(c_white);
//		draw_text(600,300,str[0]);
//		draw_set_color(c_black);
//		draw_text(600,364,str[1]);
//		break;
//	case true:
//		draw_set_color(c_black);
//		draw_text(600,300,str[0]);
//		draw_set_color(c_white);
//		draw_text(600,364,str[selector]);
//		break;
//	case false:
//		draw_set_color(c_white);
//		draw_text(600,300,str[0]);
//		break;
//}