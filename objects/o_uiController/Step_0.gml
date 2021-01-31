if (room == TutorialRoom) {
	if (!instance_exists(o_armor) && !tutorial_enemy_spawned) {
		tutorial_enemy_spawned = true;
		instance_create_layer(576, 128, "Instances", o_slime1);
	}
}