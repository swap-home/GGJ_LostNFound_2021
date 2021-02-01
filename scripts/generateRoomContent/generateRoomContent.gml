function generateRoomContent(){
	// reset spawn tables
	ds_list_clear(nextroom_enemies);
	ds_list_clear(nextroom_items);
	
	repeat(clamp(5,floor(difficulty)/2, 25)) {
		var mob = pickRandomMob();
		ds_list_add(nextroom_enemies, mob);
		enemies_spawned_this_room++;
	}

	repeat(1) {
		var item_type = pickRandomItem();
		if (item_type != ITEM_NONE) {
			ds_list_add(nextroom_items, getItemObject(item_type));
		}
	}
	var controllerId = id;
	with (o_player) {
		if (findEquippedWeapon()[1] == ITEM_NONE) {
			controllerId.spawn_dagger_on_room_start = true;
		}
	}
}