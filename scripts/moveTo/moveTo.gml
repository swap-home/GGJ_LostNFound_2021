function moveTo(target_x, target_y){
	if (point_distance(x, y, target_x, target_y) < movespeed) {
		x = target_x;
		y = target_y;
		move_target = [];
		return;
	}
	
	motion_add(point_direction(x, y, target_x, target_y), movespeed);
	speed = min(speed, movespeed);
}