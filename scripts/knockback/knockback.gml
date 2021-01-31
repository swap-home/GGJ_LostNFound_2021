function knockback(knockbacker, knockbackee, amount) {
	motion_set(point_direction(knockbacker.x, knockbacker.y, knockbackee.x, knockbackee.y), amount);
}