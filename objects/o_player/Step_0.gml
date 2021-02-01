var up_pressed = keyboard_check(ord("W"));
var down_pressed = keyboard_check(ord("S"));
var right_pressed = keyboard_check(ord("D"));
var left_pressed = keyboard_check(ord("A"));
var pickup_pressed = keyboard_check_pressed(ord("E"));

if (up_pressed) {motion_add(90, movespeed);}
if (down_pressed) {motion_add(270, movespeed);}
if (right_pressed) {motion_add(0, movespeed);}
if (left_pressed) {motion_add(180, movespeed);}
if (up_pressed || down_pressed || right_pressed || left_pressed) {
	speed = min(speed, movespeed);
}

if (pickup_pressed) {
	var pickups = ds_list_create();
	collision_circle_list(x, y, pickup_radius, o_pickup, false, true, pickups, true);

	for (var i = 0; i < ds_list_size(pickups); ++i) {
		// get first closest pickup that isn't moving
		if (pickups[| i].speed > 0) {continue;}
		
		switch (pickups[| i].object_index) {
			case o_heart:
				ds_list_add(equipment, ITEM_HEART);
				break;
			case o_heart_half:
				ds_list_add(equipment, ITEM_HEART_HALF);
				break;
			case o_heart_empty:
				// heart 
				break;
			case o_armor:
				ds_list_add(equipment, ITEM_ARMOR);
				sprite_index = s_player_armored; // check armored by checking sprite :EZ:
				break;
			case o_dagger:
				ds_list_add(equipment, ITEM_DAGGER);
				reequipWeapon();
				break;
			case o_sword:
				ds_list_add(equipment, ITEM_SWORD);
				reequipWeapon();
				break;
			case o_spear:
				ds_list_add(equipment, ITEM_SPEAR);
				reequipWeapon();
				break;
			case o_longsword:
				ds_list_add(equipment, ITEM_LONGSWORD);
				reequipWeapon();
				break;
		}
		instance_destroy(pickups[| i]);
		break;
	}
	ds_list_destroy(pickups);
}

// update sprite for self and weapon
if (instance_exists(weaponId)) {
	var facing_angle = point_direction(x, y, mouse_x, mouse_y);
	image_xscale = (facing_angle > 90 && facing_angle < 270) ? -1 : 1;
	
	var playerId = id;
	with (weaponId) {
		x = playerId.x;
		y = playerId.y;
		if (animation_timer <= 0) {
			var a = facing_angle-image_angle;

			if (abs(a) < 180) image_angle += playerId.weapon_rspeed*sign(a) else image_angle -= playerId.weapon_rspeed*sign(a);
			if (abs(a) <= playerId.weapon_rspeed) image_angle = facing_angle;

			if image_angle > 360 image_angle = 0;
			if image_angle < 0   image_angle = 360;
		}
	}

}

// update weapon state
if (weapon_cooldown-- < 0) {weapon_cooldown = 0;}
if (weapon_cooldown <= 0 && weapon_type != ITEM_NONE && mouse_check_button_pressed(mb_left)) {
	var arc = 0;
	var range = 0;
	var cooldown = 0;
	var damage = 0;
	switch (weapon_type) {
		// range based on sprite width
		case ITEM_DAGGER:
			arc = 30;
			range = abs(sprite_get_width(s_dagger)) + abs(sprite_get_xoffset(s_dagger));
			cooldown = 10;
			damage = 1;
			break;
		case ITEM_SWORD:
			arc = 60;
			range = abs(sprite_get_width(s_sword)) + abs(sprite_get_xoffset(s_sword));
			cooldown = 30;
			damage = 2;
			break;
		case ITEM_SPEAR:
			arc = 30;
			range = abs(sprite_get_width(s_spear)) + abs(sprite_get_xoffset(s_spear));
			cooldown = 30;
			damage = 2;
			break;
		case ITEM_LONGSWORD:
			arc = 45;
			range = abs(sprite_get_width(s_longsword)) + abs(sprite_get_xoffset(s_longsword));
			cooldown = 30;
			damage = 2;
			break;
	}
	swingWeapon(x, y, range, arc, weaponId.image_angle, damage);
	weapon_cooldown = cooldown;
	weaponId.animation_timer = 5;
	weaponId.image_angle += arc/2;
	weaponId.arc = arc;
}


// update invincibility frames
if (invincibility_frames-- <= 0) {
	image_alpha = 1;
	invincibility_frames = 0;
} else {
	if (invincibility_frames % 5) { 
		image_alpha	= 0.75;
	} else if (invincibility_frames % 10) {
		image_alpha = 0.25;
	}
}