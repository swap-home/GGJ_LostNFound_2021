if (!instance_exists(o_player)) {
	if (restart_timer_wait-- <= 0) {
		restart_timer_wait = 0;
		if (mouse_check_button(mb_left)) {
			difficulty = 0;
			restart_timer_wait = 30;
			var entrance_direction = irandom_range(100,103);
			var room_type = pickRandomRoom(entrance_direction);
			var entrance_coords = [];
			switch (entrance_direction) {
				case N:
					entrance_coords = has_N_entrance[? room_type];
					break;
				case S:
					entrance_coords = has_S_entrance[? room_type];
					break;
				case E:
					entrance_coords = has_E_entrance[? room_type];
					break;
				case W:
					entrance_coords = has_W_entrance[? room_type];
					break;
			}
			generateRoomContent();
			room_goto(getRoomIndex(room_type));
			instance_create_layer(entrance_coords[0], entrance_coords[1], "Instances", o_player);
			spawn_dagger_on_room_start = true;
			came_from_entrance = entrance_direction;
		}
	}
}

if (keyboard_check_pressed(ord("P"))) {
	difficulty = real(get_string("difficulty", difficulty));
}