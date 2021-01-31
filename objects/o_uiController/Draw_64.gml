if (!instance_exists(o_player)) {
	draw_text(view_hport[view_current]/2, view_wport[view_current]/2, "You died#Click to restart");
}

var ui_health_offset_x = 32;
var ui_health_offset_y = 32;
var health_margin = 24;
for (var i = 0; i < 3; ++i) {
	draw_circle_color(ui_health_offset_x + i*health_margin, ui_health_offset_y, 16, c_red, c_red, true);
}