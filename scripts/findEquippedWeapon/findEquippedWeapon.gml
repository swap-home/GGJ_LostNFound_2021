// Returns an array of 
// 0 - the index of the equipped weapon
// 1 - the item_type of the equipped weapon
//
// returns [-1, ITEM_NONE] if no weapons equipped
function findEquippedWeapon(){
	var found_weapon_index = -1
	var item_type = ITEM_NONE;
	for (var i = ds_list_size(equipment)-1; i >= 0; --i) {
		switch (equipment[| i]) {
			case ITEM_DAGGER:
			case ITEM_SWORD:
			case ITEM_SPEAR:
			case ITEM_LONGSWORD:
				found_weapon_index = i;
		}
		if (found_weapon_index > -1) {
			item_type = equipment[| i];
			break;
		}
	}
	return [found_weapon_index, item_type];
}