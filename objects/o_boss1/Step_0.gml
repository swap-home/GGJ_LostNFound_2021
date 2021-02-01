event_inherited();

if (spawn_timer-- <= 0) {
	spawn_timer = spawn_timer_max;
	if (instance_number(o_mob) > 30) {
		return;
	}
	repeat(floor(o_levelController.difficulty/25)) {
		var new_mob = instance_create_layer(x, y, "Instances", o_slime3);
		with (new_mob) {motion_add(random(360), 10);}
	}
	repeat(floor(o_levelController.difficulty/20)) {
		var new_mob = instance_create_layer(x, y, "Instances", o_slime2);
		with (new_mob) {motion_add(random(360), 15);}
	}
	repeat(floor(o_levelController.difficulty/20)) {
		var new_mob = instance_create_layer(x, y, "Instances", o_slime1);
		with (new_mob) {motion_add(random(360), 20);}
	}
}