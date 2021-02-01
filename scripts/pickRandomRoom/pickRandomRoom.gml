function pickRandomRoom(entrance_direction){
	switch (entrance_direction) {
		case N:
			return getRandomKeyFromDSMap(has_N_entrance);
		case S:
			return getRandomKeyFromDSMap(has_S_entrance);
		case E:
			return getRandomKeyFromDSMap(has_E_entrance);
		case W:
			return getRandomKeyFromDSMap(has_W_entrance);
	}
}