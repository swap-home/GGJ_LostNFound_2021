if (spawn_dagger_on_room_start) {
	spawn_dagger_on_room_start = false;
	instance_create_layer(o_player.x, o_player.y, "Effects", o_dagger);	
}

for (var i = 0; i < ds_list_size(nextroom_enemies); ++i) {
	// unhardcode this
	if (nextroom_enemies[| i] == o_boss1) {
		if (o_player.x < room_width / 2) {
			instance_create_layer(1056, 384, "Instances", nextroom_enemies[| i]);
		} else {
			instance_create_layer(310, 384, "Instances", nextroom_enemies[| i]);
		}
		return;
	}
	var spawned = false;
	while (!spawned) {
		var check_coords = [0, 0];
		check_coords[0] = random(room_width);
		check_coords[1] = random(room_height);
		var spawning_sprite = object_get_sprite(nextroom_enemies[| i]);
		var x1 = check_coords[0] - sprite_get_xoffset(spawning_sprite);
		var y1 = check_coords[1] - sprite_get_yoffset(spawning_sprite);
		if (collision_rectangle(x1, y1, x1 + sprite_get_width(spawning_sprite), y1 + sprite_get_height(spawning_sprite), o_blocker, false, true) == noone) {
			spawned = true;
			instance_create_layer(check_coords[0], check_coords[1], "Instances", nextroom_enemies[| i]);
		}
	}
}

for (var i = 0; i < ds_list_size(nextroom_items); ++i) {
	var spawned = false;
	while (!spawned) {
		var check_coords = [0,0];
		check_coords[0] = random(room_width);
		check_coords[1] = random(room_height);
		if (collision_point(check_coords[0], check_coords[1], o_blocker, false, true) == noone) {
			spawned = true;
			instance_create_layer(check_coords[0], check_coords[1], "Effects", nextroom_items[| i]);
		}
	}
}

ds_list_clear(nextroom_enemies);
ds_list_clear(nextroom_items);