function moveTo(target_x, target_y, movespeed){
	if (point_distance(x, y, target_x, target_y) < movespeed) {
		x = target_x;
		y = target_y;
		return []
	}
	
	motion_add(point_direction(x, y, target_x, target_y), movespeed);
	speed = min(speed, movespeed);
	
	return [target_x, target_y];
}