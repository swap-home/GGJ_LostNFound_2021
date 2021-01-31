if (!instance_exists(o_player)) {
	draw_text(view_xport[0] + view_wport[0]/2, view_yport + view_hport[0]/2, "You died. Click to restart");
}


if (room == TutorialRoom && instance_exists(o_player)) {
	var originalColor = draw_get_color();
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	
	if (o_player.x < 160) {
		draw_text(96, 160, "Press WSAD to move");
	}
	
	if (o_player.x >= 192 && o_player.x < 320) {
		draw_text(256, 160, "Press E to pick up");
	}
	
	if (o_player.x >= 352 && o_player.x < 480) {
		if (instance_exists(o_armor)) {
			draw_text(416, 160, "Armor will protect you!");
		} else {
			draw_text(416, 160, "Left click to swing!");
		}
	}
	
	if (o_player.x >= 512) {
		draw_text(576, 160, "Your adventure begins -->");
	}
	
	draw_set_color(originalColor);
}