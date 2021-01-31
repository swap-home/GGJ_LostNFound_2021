if (animation_timer-- > 0) {
	image_angle -= arc/duration;
}

if (animation_timer < 0) {animation_timer = 0};