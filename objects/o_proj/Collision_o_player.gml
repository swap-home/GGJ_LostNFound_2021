var projectileId = id;
var damage = projectile_damage;
with (other) {
	if (invincibility_frames <= 0) {
		life -= damage;
		knockback(projectileId, id, damage*10);
		invincibility_frames = invincibility_frames_max;
	}
}