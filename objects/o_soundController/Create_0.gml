var musicid = snd_bg;
if (irandom(100) < 1) musicid = snd_bgloop;

audio_play_sound(musicid, 100, 1);