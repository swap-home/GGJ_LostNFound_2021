function generateAndMoveToNextRoom(exit_direction){
	
	// update stats
	rooms_cleared++;
	modifyDifficulty(5);
	
	if (enemies_killed_this_room == enemies_spawned_this_room) {
		modifyDifficulty(2.5);
		if (hits_taken_this_room == 0) {
			modifyDifficulty(10);	
		}
	}
	
	total_hits_taken += hits_taken_this_room;
	total_enemies_killed += enemies_killed_this_room;
	total_enemies_spawned += enemies_spawned_this_room;

	hits_taken_this_room = 0;
	enemies_killed_this_room = 0;
	enemies_spawned_this_room = 0;


	// generate next room
	var nextroom;
	var entrance_direction = W;
	switch (exit_direction) {
		case N: entrance_direction = S; break;
		case S: entrance_direction = N; break;
		case E: entrance_direction = W; break;
		case W: entrance_direction = E; break;
	}
	var entrance_coords = [];
	if (difficulty > 50 && (exit_direction == W || exit_direction == E) ){ // && irandom(4) == 0) {
		nextroom = LargeRoom;
		// reset spawn tables
		ds_list_clear(nextroom_enemies);
		ds_list_clear(nextroom_items);
		ds_list_add(nextroom_enemies, o_boss1);
		entrance_coords = [exit_direction==E ? 64 : 1312, 384];
	} else {
		generateRoomContent();
		var nextroomtype = pickRandomRoom(entrance_direction);
		nextroom = getRoomIndex(nextroomtype);
		switch (entrance_direction) {
			case N: entrance_coords = has_N_entrance[? nextroomtype]; break;
			case S: entrance_coords = has_S_entrance[? nextroomtype]; break;
			case E: entrance_coords = has_E_entrance[? nextroomtype]; break;
			case W: entrance_coords = has_W_entrance[? nextroomtype]; break;
		}
	}
	
	room_goto(nextroom);
	o_player.x = entrance_coords[0];
	o_player.y = entrance_coords[1];
	came_from_entrance = entrance_direction;
}