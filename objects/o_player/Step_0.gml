if !draw_menu{
	if keyboard_check_pressed(ord("R")){
		game_restart()
	}
	
	
	button_up = keyboard_check(vk_up);
	button_left = keyboard_check(vk_left);
	button_right = keyboard_check(vk_right);

	button_x = keyboard_check(ord("X"));
	button_a = keyboard_check(vk_space);
	button_b = keyboard_check(ord("C"));

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

	ground_check();

	player_y_offset += vsp;	
	z-=vsp;




	timer --;
	if timer < 0 {
		if trick_score > global.highscore{
			var ini_path = "highscore.ini"; 
			ini_open(ini_path);
			global.highscore = ini_write_real("GameData", "highscore", trick_score);
			ini_close();	
		}

    
	    if (file_exists("save_data.ini")) {
	        file_delete("save_data.ini");
	    } 
		game_restart();	
	}

	var target = self;
	var target_x = target.x;
	var target_y = target.y + player_y_offset;

	// Get the camera's dimensions
	var cam_width = view_wport[0] / 4;
	var cam_height = view_hport[0] / 4;

	// Clamp the camera position within the room boundaries
	var cam_x = clamp(target_x - cam_width, 0, room_width - cam_width*2);
	var cam_y = clamp(target_y - cam_height, 0, room_height - cam_height*2);

	// Set the camera position
	camera_set_view_pos(view_camera[0], cam_x, cam_y);	
	
	
	
	if land_timer > 0 {
	 land_timer --;	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}