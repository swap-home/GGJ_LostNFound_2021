// variables to be set by parent
parent_id = noone;
projectile_start = [0, 0];
projectile_target = [0, 0];


projectile_damage = 1;
projectile_speed = 6;
projectile_range = 1200;
projectile_duration = 0;
projectile_duration_max = 0; // calculate from range / speed during init, or -1 if infinite

projectile_homing = false;

// unused
projectile_speed_rampup_amount = 0;
projectile_speed_rampup_duration = 0;
projectile_speed_rampup_duration_max = 0;
