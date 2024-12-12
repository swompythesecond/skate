if keyboard_check_pressed(ord("R")){
	game_restart()
}

player_state_step(id);


if (player_rotation > player_rotation_max) {
    player_rotation = 0;
} else if (player_rotation < 0) {
    player_rotation = player_rotation_max;
}


if player_animation_index > player_animation_index_max{
	player_animation_index = player_animation_index_max;	
}


if player_animation_index < 0{
	player_animation_index = 0;	
}