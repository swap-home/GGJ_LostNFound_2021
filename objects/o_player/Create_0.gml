#macro ITEM_NONE 0
#macro ITEM_DAGGER 1
#macro ITEM_SWORD 2
#macro ITEM_SPEAR 3
#macro ITEM_LONGSWORD 4

#macro ITEM_HEART 5
#macro ITEM_ARMOR 6

movespeed = 3;
life = 5;
friction = 1;

invincibility_frames = 0;
invincibility_frames_max = 45;
weapon_cooldown = 0;
weaponId = instance_create_layer(x, y, "Effects", o_weapon);
weaponId.sprite_index = -1;
weapon_type = ITEM_NONE;
weapon_rspeed = 360; 

equipment = ds_list_create();
repeat(life) {
	ds_list_add(equipment, ITEM_HEART);
}