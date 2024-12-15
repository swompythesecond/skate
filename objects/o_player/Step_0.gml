if keyboard_check_pressed(ord("R")){
	game_restart()
}

vsp += grv;



player_state_step();


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

if board_animation == true {
	board_animation_index += board_animation_speed;	
}

if board_animation_index > board_animation_index_max{
	board_animation = false;
	board_animation_index = 0;
}


if board_animation_index < 0{
	board_animation_index = 0;	
}

if board_rotation_check == true {
	board_rotation += board_rotation_speed;	
	if board_rotation > board_rotation_max{
		board_rotation -= board_rotation_max;
	}
	if angle_difference_with_overflow(board_rotation_start, board_rotation, board_rotation_max) > floor(board_rotation_max/2)-1 {
		board_rotation_check = false;
		board_rotation = get_angle_without_overflow(floor(board_rotation_start+board_rotation_max/2), board_rotation_max);
	}

}
else{
	board_rotation = player_rotation;	
}



player_y_offset += vsp;	

