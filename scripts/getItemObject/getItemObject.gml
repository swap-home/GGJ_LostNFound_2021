// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getItemObject(item_type){
	switch(item_type) {
		case ITEM_HEART: return o_heart;
		case ITEM_HEART_HALF: return o_heart_half;
		case ITEM_HEART_EMPTY: return o_heart_empty;
		case ITEM_ARMOR: return o_armor;
		case ITEM_DAGGER: return o_dagger;
		case ITEM_SWORD: return o_sword;
		case ITEM_SPEAR: return o_spear;
		case ITEM_LONGSWORD: return o_longsword;
		
		case ITEM_NONE:
		default:
			return -1;
	}
}