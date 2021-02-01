var exit_direction = N;
if (x > room_width) {
	exit_direction = E;
} else if (x < 0) {
	exit_direction = W;	
} else if (y > room_height) {
	exit_direction = S;	
} else if (y < room_height) {
	exit_direction = N;	
}

if (exit_direction == o_levelController.came_from_entrance) {
	if x>room_width x=room_width; if x<0 x=0; if y>room_height y=room_height; if y<0 y=0;
} else {
	with (o_levelController) {
		generateAndMoveToNextRoom(exit_direction);
	}
}