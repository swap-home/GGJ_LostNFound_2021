
function swingWeapon(origin_x, origin_y, range, arc, angle, damage){
	var hitlist = ds_list_create();
	var number_hit = collision_circle_list(x, y, range, o_enemy, true, true, hitlist, true);
	var knockback_base = 5;
	var knockback_per_damage = 2.5;
	var stun_per_damage = 30;
	var playerId = id;
	if number_hit > 0 {
	    for (var i = 0; i < number_hit; ++i;) {
			with (hitlist[| i]) {
				
				// if it hits
				if (angle_difference(point_direction(origin_x, origin_y, x, y),angle) < arc/2 + 2) {
					inc_damage = floor(damage - armor);
					
					// if it deals damage
					if (inc_damage > 0) {
						with (o_levelController) {modifyDifficulty(0.1);}
						life -= inc_damage;
						if (life < damage) life = 0;
					
						// knockback and reset mob movement
						move_target = [];
						attack_target = [];
						idle_move_cooldown = damage * stun_per_damage;
						aggro_move_cooldown = damage * stun_per_damage;
						knockback(playerId, id, knockback_base + damage * knockback_per_damage);
					}
				}
			}
	    }
	}
	ds_list_destroy(hitlist);
}