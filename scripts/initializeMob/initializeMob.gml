function initializeMob(){
	idle_move_cooldown = irandom_range(idle_move_cooldown_min, idle_move_cooldown_max);
	idle_aggro_timer = irandom_range(idle_aggro_timer_min, idle_aggro_timer_max);
	aggro_move_cooldown = irandom_range(aggro_move_cooldown_min, aggro_move_cooldown_max);
	aggro_attack_cooldown = irandom_range(aggro_attack_cooldown_min, aggro_attack_cooldown_max);
	aggro_attack_delay = irandom_range(aggro_attack_delay_min, aggro_attack_delay_max);
}