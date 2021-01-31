if (room == TutorialRoom) {
	var originalColor = draw_get_color();
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	
	if (o_player.x < 160) {
		draw_text(96, 160, "Press WSAD to move");
	}
	
	if (o_player.x >= 192 && o_player.x < 320)
	draw_text(256, 160, "Press E to pick up");
	draw_set_color(originalColor);
}