if (!instance_exists(o_player)) {
	return;
}

var ui_scale = 3;
var item_margin = 24 * ui_scale;
var ui_health_offset_x = 32 * ui_scale;
var ui_health_offset_y = 32 * ui_scale;
var ui_health_icon_radius = 8 * ui_scale;
var ui_boss_healthbar_offset_x = ui_health_offset_x;
var ui_boss_healthbar_offset_y = ui_health_offset_y + item_margin;
var ui_boss_healthbar_max_width = 200 * ui_scale;
var ui_boss_healthbar_max_height = 10 * ui_scale;

var found_weapon_index = -1
with (o_player) {found_weapon_index = findEquippedWeapon()[0];}

for (var i = 0; i < ds_list_size(o_player.equipment); ++i) {
	var bgcolor = c_grey;
	
	switch (o_player.equipment[| i]) {
		case ITEM_HEART:
			draw_sprite_ext(s_heart, 0, ui_health_offset_x + i*item_margin, ui_health_offset_y, ui_scale, ui_scale, 0, c_white, 1);
			bgcolor = c_red;
			break;
		case ITEM_HEART_HALF:
			draw_sprite_ext(s_heart_half, 0, ui_health_offset_x + i*item_margin, ui_health_offset_y, ui_scale, ui_scale, 0, c_white, 1);
			bgcolor = c_red;
			break;
		case ITEM_HEART_EMPTY:
			draw_sprite_ext(s_heart_empty, 0, ui_health_offset_x + i*item_margin, ui_health_offset_y, ui_scale, ui_scale, 0, c_white, 1);
			bgcolor = c_red;
			break;
		case ITEM_ARMOR:
			draw_sprite_ext(s_armor, 0, ui_health_offset_x + i*item_margin, ui_health_offset_y, ui_scale, ui_scale, 0, c_white, 1);
			bgcolor = c_teal;
			break;
		case ITEM_DAGGER:
			var spriteId = s_dagger;
			draw_sprite_ext(spriteId, 0, ui_health_offset_x + ui_scale*(sprite_get_xoffset(spriteId) - sprite_get_width(spriteId)/2) + i*item_margin, ui_health_offset_y, ui_scale, ui_scale, 0, c_white, 1);
			bgcolor = c_grey;
			break;
		case ITEM_SWORD:
			var spriteId = s_sword;
			draw_sprite_ext(spriteId, 0, ui_health_offset_x + ui_scale*(sprite_get_xoffset(spriteId) - sprite_get_width(spriteId)/2) + i*item_margin, ui_health_offset_y, ui_scale, ui_scale, 0, c_white, 1);
			bgcolor = c_grey;
			break;
		case ITEM_SPEAR:
			var spriteId = s_spear;
			draw_sprite_ext(spriteId, 0, ui_health_offset_x + ui_scale*(sprite_get_xoffset(spriteId) - sprite_get_width(spriteId)/2) + i*item_margin, ui_health_offset_y, ui_scale, ui_scale, 0, c_white, 1);
			bgcolor = c_grey;
			break;
		case ITEM_LONGSWORD:
			var spriteId = s_longsword;
			draw_sprite_ext(spriteId, 0, ui_health_offset_x + ui_scale*(sprite_get_xoffset(spriteId) - sprite_get_width(spriteId)/2) + i*item_margin, ui_health_offset_y, ui_scale, ui_scale, 0, c_white, 1);
			bgcolor = c_grey;
			break;
	}
	if (i == found_weapon_index) {bgcolor = c_black;}
	draw_circle_color(ui_health_offset_x + i*item_margin, ui_health_offset_y, ui_health_icon_radius, bgcolor, bgcolor, true);
}

if (instance_exists(o_boss)) {
	var origColor = draw_get_color();
	var boss_health_percentage = o_boss.life / o_boss.life_max;
	draw_set_color(c_black);
	draw_rectangle(ui_boss_healthbar_offset_x-ui_health_icon_radius-1, ui_boss_healthbar_offset_y-1, 
		ui_boss_healthbar_offset_x + ui_boss_healthbar_max_width+1, 
		ui_boss_healthbar_offset_y + ui_boss_healthbar_max_height+1, true);
	draw_set_color(c_red);
	draw_rectangle(ui_boss_healthbar_offset_x-ui_health_icon_radius, ui_boss_healthbar_offset_y, 
		ui_boss_healthbar_offset_x + ui_boss_healthbar_max_width * boss_health_percentage, 
		ui_boss_healthbar_offset_y + ui_boss_healthbar_max_height, false);
	draw_set_color(origColor);
}


//draw_text(ui_health_offset_x, ui_health_offset_y*2, o_levelController.difficulty);