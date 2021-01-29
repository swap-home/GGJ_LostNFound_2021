
function swingWeapon(origin_x, origin_y, range, arc, angle, damage){
	var hitlist = ds_list_create();
	var number_hit = collision_circle_list(x, y, range, o_enemy, true, true, hitlist, true);
	var knockback_per_damage = 10;
	var stun_per_damage = 30;
	if number_hit > 0 {
	    for (var i = 0; i < number_hit; ++i;) {
			with (hitlist[| i]) {
				
				// if it hits
				if (point_direction(origin_x, origin_y, x, y)-angle < arc/2) {
					inc_damage = floor(damage - armor);
					
					// if it deals damage
					if (inc_damage > 0) {
						life -= inc_damage;
						if (life < damage) life = 0;
					
						// knockback and reset mob movement
						move_target = [];
						idle_move_cooldown = damage * stun_per_damage;
						aggro_move_cooldown = damage * stun_per_damage;
						motion_set(point_direction(origin_x, origin_y, x, y), damage * knockback_per_damage);
					}
				}
			}
	    }
	}
	ds_list_destroy(hitlist);
}