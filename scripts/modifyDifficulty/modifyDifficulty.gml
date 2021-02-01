function modifyDifficulty(difficulty_delta){
	difficulty += difficulty_delta;
	difficulty = clamp(difficulty, 0, 100);
}