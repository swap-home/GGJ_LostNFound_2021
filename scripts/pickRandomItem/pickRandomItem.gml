// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pickRandomItem(){
	var items = ds_map_create();
	items[? ITEM_DAGGER] = 5;
	items[? ITEM_HEART] = 5;
	items[? ITEM_HEART_HALF] = 5;
	items[? ITEM_HEART_EMPTY] = 1;
	items[? ITEM_ARMOR] = 3;
	items[? ITEM_NONE] = 10;
	items[? ITEM_SWORD] = 0;
	items[? ITEM_SPEAR] = 0;
	items[? ITEM_LONGSWORD] = 0;
	
	if (difficulty > 0) {
		items[? ITEM_SWORD] += 5;
	}
	
	if (difficulty > 10) {
		items[? ITEM_HEART_HALF] += 5;
		items[? ITEM_HEART_EMPTY] += 4;
		items[? ITEM_SPEAR] += 5;
		items[? ITEM_NONE] += 10;
	}
	
	if (difficulty > 20) {
		items[? ITEM_HEART_HALF] += 5;
		items[? ITEM_HEART_EMPTY] += 5;
		items[? ITEM_LONGSWORD] += 5;
		items[? ITEM_NONE] += 10;
	}
	
	if (difficulty > 50) {
		items[? ITEM_HEART_HALF] += 5;
		items[? ITEM_HEART_EMPTY] += 5;
		items[? ITEM_DAGGER] = 1;
		items[? ITEM_SWORD] = 1;
		items[? ITEM_SPEAR] = 1;
		items[? ITEM_LONGSWORD] = 1;
		items[? ITEM_NONE] += 10;
	}
	
	var item = rollWeightedDSMap(items);
	ds_map_destroy(items);
	return item;
}