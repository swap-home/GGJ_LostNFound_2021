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
	var facing_angle = point_direction(x+lengthdir_x(12,image_angle-90),y+lengthdir_y(12,image_angle-90),mouse_x,mouse_y);
	var a = facing_angle-image_angle;

	if (abs(a) < 180) image_angle += rspeed*sign(a) else image_angle -= rspeed*sign(a);
	if (abs(a) <= rspeed) image_angle = facing_angle;

	if image_angle > 360 image_angle = 0;
	if image_angle < 0   image_angle = 360;
}

if (mouse_check_button_pressed(mb_left)) {
	//sword
	if (true) {
		var arc = 90;
		var range = 72;
		weapon_cooldown = swingWeapon(x, y, range, arc, image_angle, 1);
		var eff = instance_create_layer(x, y, "Instances", o_sword);
		eff.image_angle = image_angle + arc/2;
		eff.arc = arc;
	}
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