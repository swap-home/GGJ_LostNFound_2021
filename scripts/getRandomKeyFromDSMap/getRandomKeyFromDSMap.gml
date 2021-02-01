function getRandomKeyFromDSMap(map){
	var i = irandom(ds_map_size(map)-1);
	var item = ds_map_find_first(map);
	repeat(i) {
		item = ds_map_find_next(map, item);
	}
	return item;
}