function getRoomIndex(room_type){
	switch (room_type) {
		case ROOM_TUT:
			return TutorialRoom;
		case ROOM_1:
			return Room1;
		case ROOM_2:
			return Room2;
		case ROOM_3:
			return Room3;
		case ROOM_4:
			return Room4;
		case ROOM_5:
			return Room5;
	}
}