if (keyboard_check(ord("W"))) {motion_add(90, movespeed);}
if (keyboard_check(ord("S"))) {motion_add(270, movespeed);}
if (keyboard_check(ord("D"))) {motion_add(0, movespeed);}
if (keyboard_check(ord("A"))) {motion_add(180, movespeed);}
speed = min(speed, movespeed);


if x>room_width x=room_width; if x<0 x=0; if y>room_height y=room_height; if y<0 y=0;

if point_distance(x,y,mouse_x,mouse_y) > 15 {
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