// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getItemSprite(item_type){
	switch(item_type) {
		case ITEM_HEART: return s_heart;
		case ITEM_HEART_HALF: return s_heart_half;
		case ITEM_HEART_EMPTY: return s_heart_empty;
		case ITEM_ARMOR: return s_armor;
		case ITEM_DAGGER: return s_dagger;
		case ITEM_SWORD: return s_sword;
		case ITEM_SPEAR: return s_spear;
		case ITEM_LONGSWORD: return s_longsword;
		
		case ITEM_NONE:
		default:
			return -1;
	}
}