#macro ROOM_TUT 0
#macro ROOM_1 1
#macro ROOM_2 2
#macro ROOM_3 3
#macro ROOM_4 4
#macro ROOM_5 5

#macro N 100
#macro S 101
#macro E 102
#macro W 103

// initialize rooms and lists of rooms with exits
difficulty = 0;
rooms_cleared = 0;
restart_timer_wait = 30;
spawn_dagger_on_room_start = false;
came_from_entrance = W;

// stats
hits_taken_this_room = 0;
enemies_killed_this_room = 0;
enemies_spawned_this_room = 0;

total_hits_taken = 0;
total_enemies_killed = 0;
total_enemies_spawned = 0;

nextroom_enemies = ds_list_create();
nextroom_items = ds_list_create();

has_N_entrance = ds_map_create();
has_S_entrance = ds_map_create();
has_E_entrance = ds_map_create();
has_W_entrance = ds_map_create();

// don't allow generation for tutorial room
// has_E_entrance[? ROOM_TUT] = [720, 144];

has_E_entrance[? ROOM_1] = [1024, 224];
has_W_entrance[? ROOM_1] = [32, 224];

has_S_entrance[? ROOM_2] = [270, 480];
has_E_entrance[? ROOM_2] = [512, 256];
has_W_entrance[? ROOM_2] = [32, 256];

has_N_entrance[? ROOM_3] = [256, 32];
has_S_entrance[? ROOM_3] = [256, 448];
has_E_entrance[? ROOM_3] = [480, 256];
has_W_entrance[? ROOM_3] = [32, 256];

has_E_entrance[? ROOM_4] = [416, 160];
has_W_entrance[? ROOM_4] = [32, 448];

has_N_entrance[? ROOM_5] = [128, 32];
has_S_entrance[? ROOM_5] = [416, 480];
