// call this to reset the weapon whenever it changes
// it will try to equip the rightmost weapon
// if no weapons exist, your current weapon is unequipped
function reequipWeapon() {
	var equipped = findEquippedWeapon();
	
	weapon_type = equipped[1];
	weaponId.sprite_index = getItemSprite(weapon_type);
}