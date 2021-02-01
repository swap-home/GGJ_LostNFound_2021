if (room == LargeRoom) {
	audio_stop_sound(bgId);
	bgId = snd_bg_boss;
	audio_play_sound(bgId, 100, true);
} if (room != LargeRoom && bgId == snd_bg_boss) {
	audio_stop_sound(bgId);
	bgId = snd_bg_mob;
	audio_play_sound(bgId, 100, true);
}