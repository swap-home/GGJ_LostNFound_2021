#macro WEAPON_NONE 0
#macro WEAPON_DAGGER 1
#macro WEAPON_SWORD 2
#macro WEAPON_SPEAR 3
#macro WEAPON_LONGSWORD 4

movespeed = 3;
life = 50;
friction = 1;

invincibility_frames = 0;
invincibility_frames_max = 45;
weapon_cooldown = 0;
weaponId = instance_create_layer(x, y, "Effects", o_weapon);
weaponId.sprite_index = s_dagger;
weapon_type = WEAPON_DAGGER;
weapon_rspeed = 360; 