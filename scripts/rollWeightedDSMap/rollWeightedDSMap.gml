// expects a map of keys to integers
// ex: ITEM_HEART => 10, ITEM_ARMOR => 5, rolling 0-9 returns ITEM_HEART, rolling 10-14 returns ITEM_ARMOR
// means there is twice the chance of returning ITEM_HEART than ITEM_ARMOR
// returns a randomly selected key according to the values as integer weights
function rollWeightedDSMap(map){
	var total = 0;
	
	var item = ds_map_find_first(map);
	while(!is_undefined(item)) {
		total += map[? item];
		item = ds_map_find_next(map, item);
	}
	
	if (total > 0) {
		var target = irandom(total-1);
		
		var item = ds_map_find_first(map);
		while(!is_undefined(item)) {
			target -= map[? item];
			if (target < 0) {return item;}
			item = ds_map_find_next(map, item);
		}
	}
	
	throw "empty map passed to rollWeightedDSMap";
}