/// @description Insert description here
// You can write your code in this editor
event_inherited();

newSprite = sprite_duplicate(sprite_index);
sprite_index = newSprite;
sprite_set_offset(newSprite, sprite_get_width(newSprite)/2, sprite_get_height(newSprite)/2);