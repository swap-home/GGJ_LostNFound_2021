var up_pressed = keyboard_check(ord("W"));
var down_pressed = keyboard_check(ord("S"));
var right_pressed = keyboard_check(ord("D"));
var left_pressed = keyboard_check(ord("A"));

if (up_pressed) {motion_add(90, movespeed);}
if (down_pressed) {motion_add(270, movespeed);}
if (right_pressed) {motion_add(0, movespeed);}
if (left_pressed) {motion_add(180, movespeed);}
if (up_pressed || down_pressed || right_pressed || left_pressed) {
	speed = min(speed, movespeed);
}


if x>room_width x=room_width; if x<0 x=0; if y>room_height y=room_height; if y<0 y=0;

if point_distance(x,y,mouse_x,mouse_y) > 16 {
	var facing_angle = point_direction(x, y, mouse_x, mouse_y);
	image_xscale = (facing_angle > 90 && facing_angle < 180) ? -1 : 1;
	
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

if (weapon_cooldown-- < 0) {weapon_cooldown = 0;}
if (weapon_type != WEAPON_NONE && mouse_check_button_pressed(mb_left)) {
	var arc = 0;
	var range = 0;
	var cooldown = 0;
	var damage = 0;
	switch (weapon_type) {
		case WEAPON_DAGGER:
			arc = 30;
			range = abs(s_dagger.sprite_width) + abs(s_dagger.sprite_xoffset);
			cooldown = 10;
			damage = 1;
			break;
		case WEAPON_SWORD:
			arc = 70;
			range = s_sword.sprite_width + abs(s_sword.sprite_xoffset);
			cooldown = 30;
			damage = 2;
			break;
		case WEAPON_SPEAR:
			arc = 30;
			range = s_spear.sprite_width + abs(s_spear.sprite_xoffset);
			cooldown = 30;
			damage = 2;
			break;
		case WEAPON_LONGSWORD:
			arc = 60;
			range = s_longsword.sprite_width + abs(s_longsword.sprite_xoffset);
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