function initializeProjectile(){
	if (projectile_duration_max == 0) {
		projectile_duration_max = ceil(projectile_range/projectile_speed);
	}
	projectile_duration = projectile_duration_max;
	projectile_bounce = projectile_bounce_max;
}