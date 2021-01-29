event_inherited();

// AI State management
var next_state = state;
switch (state) {
	case AI_IDLE:
		if (idle_move_cooldown-- <= 0) {
			idle_move_cooldown = irandom_range(idle_move_cooldown_min, idle_move_cooldown_max);
			var move_dist = irandom_range(idle_move_range_min, idle_move_range_max);
			var move_dir = irandom_range(0,360);
			move_target[0] = x + lengthdir_x(move_dist, move_dir);
			move_target[1] = y + lengthdir_y(move_dist, move_dir);
		}
		if (idle_aggro_timer-- <= 0 || distance_to_object(o_player) < idle_aggro_distance) {
			next_state = AI_AGGRO;
			break;
		}
		break;
	case AI_AGGRO:
		if (aggro_attack_cooldown-- <= 0 
			&& distance_to_object(o_player) < aggro_attack_range_min
			&& distance_to_object(o_player) > aggro_attack_range_max) {
				aggro_attack_cooldown = irandom_range(aggro_attack_cooldown_min, aggro_attack_cooldown_min);
				attack_target[0] = o_player.x;
				attack_target[1] = o_player.y;
				move_target = [];
		} else if (aggro_move_cooldown-- <= 0) {
			aggro_move_cooldown = irandom_range(aggro_move_cooldown_min, aggro_move_cooldown_min);
			var move_dist = irandom_range(aggro_move_range_min, aggro_move_range_max);
			var move_dir = point_direction(x, y, o_player.x, o_player.y);
			move_target[0] = x + lengthdir_x(move_dist, move_dir);
			move_target[1] = y + lengthdir_y(move_dist, move_dir);
		}
		break;
	case AI_RETREAT:
		break;
}

state = next_state;

if (array_length_1d(move_target) > 0) {
	moveTo(move_target[0], move_target[1]);
}


// attack virtual function here