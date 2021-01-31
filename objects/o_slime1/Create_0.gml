event_inherited();

life = 2;
movespeed = 2;

if (room == TutorialRoom) {
	life = 1;
	movespeed = 0;
}

aggro_attack_range_min = 0;
aggro_attack_range_max = 64;

aggro_attack_dash_multi = 1;

initializeMob();