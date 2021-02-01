function takeHit(attackerId, damage){
	
	if (invincibility_frames <= 0) {
		with (o_levelController) {hits_taken_this_room++; modifyDifficulty(-1);}
		if (ds_list_size(equipment) == 0) {
			instance_destroy();
			return;
		}
		var i = irandom(ds_list_size(equipment)-1);
		var item_type = equipment[| i];
		var dropEquippedWeapon = false;
		// If it was the held weapon, reequip the rightmost weapon after we drop it
		if (i == findEquippedWeapon()[0]) {
			dropEquippedWeapon = true;
		}
		
		// remove the item from equipments
		ds_list_delete(equipment, i);
	
		// If it was a heart, take damage
		if (item_type == ITEM_HEART_HALF) {item_type = ITEM_HEART_EMPTY;}
		else if (item_type == ITEM_HEART) {item_type = ITEM_HEART_HALF;}
		
		// If it was armor and there is no more armor in equipment, change sprite
		if (item_type == ITEM_ARMOR &&
			ds_list_find_index(equipment, ITEM_ARMOR) == -1) {
				sprite_index = s_player;
		}
	
		// If it was the equipped weapon, find something to reequip
		if (dropEquippedWeapon) {reequipWeapon();}
	
		var knockback_multiplier = 10; // greater than 16 may cause clipping through blockers, which are 32x32
		// armor reduces knockback of items and yourself by half
		if (sprite_index == s_player_armored) {knockback_multiplier /= 2;}
		var lostitemId = instance_create_layer(x, y, "Effects", getItemObject(item_type));
		with (lostitemId) {
			motion_set(random(360), damage * knockback_multiplier);
		}

		knockback(attackerId, id, damage * knockback_multiplier);
		invincibility_frames = invincibility_frames_max;
	}
}