if (projectile_duration-- = 0) { // negative numbers mean the projectile has infinite duration
	instance_destroy();
	return;
}

if (projectile_homing) {
	projectile_target[0] = o_player.x;
	projectile_target[1] = o_player.y;
}

speed = projectile_speed;
direction = point_direction(x, y, projectile_target[0], projectile_target[1]);

if (point_distance(x, y, projectile_target[0], projectile_target[1]) <= speed) {
	x = projectile_target[0];
	y = projectile_target[1];
	speed = 0;
	projectile_duration = 0;
}