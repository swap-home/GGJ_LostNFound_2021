// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pickRandomMob(){
	var mobs = ds_map_create();
	mobs[? o_slime1] = 20;
	mobs[? o_slime2] = 0;
	mobs[? o_slime3] = 0;
	
	if (difficulty > 0 && rooms_cleared > 0) {
		mobs[? o_slime2] += 5;
	}
	
	if (difficulty > 10 && rooms_cleared > 2) {
		mobs[? o_slime2] += 10;
		mobs[? o_slime3] += 5;
	}
	
	if (difficulty > 20) {
		mobs[? o_slime2] += 10;
		mobs[? o_slime3] += 10;
	}
	
	if (difficulty > 50) {
		mobs[? o_slime1] = 1;
		mobs[? o_slime2] += 5;
		mobs[? o_slime3] += 5;
	}
	
	var mob = rollWeightedDSMap(mobs);
	ds_map_destroy(mobs);
	return mob;
}