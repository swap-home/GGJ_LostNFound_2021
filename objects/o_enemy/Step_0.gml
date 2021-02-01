if (life <= 0) {
	with (o_levelController) {enemies_killed_this_room++; modifyDifficulty(0.2);}
	instance_destroy();
}