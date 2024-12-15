player_sprite_width = 75;
player_sprite_height = 75;

draw_board = false;
player_rotation = 0;
player_spritesheet = s_riding_regular;
player_rotation_max = (sprite_get_width(player_spritesheet)/player_sprite_width)-1;
change_sprite_sheet(id, s_riding_regular)


player_rotation_speed = 0.25;

player_animation_index = 3;
player_animation_speed = 0.25;

player_speed = 2;
player_direction = 0;


player_y_offset = 0;
z = 0;
vsp = 0;
grv = 0.3;

board_sprite_width = 50;
board_sprite_height = 50;

board_animation_index = 0;
board_animation_index_max = 20;
board_animation = false;
board_animation_speed = 1;
board_rotation_start = 0;

board_rotation_check = false;
board_rotation_speed = 1;
board_rotation = 0;
board_rotation_max = 31;


angle_for_frame = [
   -26.57,  -36.81,  -50.36,  -68.31,
      -90, -111.69, -129.64, -143.19,
  -153.43, -161.53,  -168.3, -174.32,
     -180,  174.32,   168.3,  161.53,
   153.43,  143.19,  129.64,  111.69,
       90,   68.31,   50.36,   36.81,
    26.57,   18.47,    11.7,    5.68,
        0,   -5.68,   -11.7,  -18.47
]


function player_state_step_bail() {
	vsp = 0;
	player_y_offset = 0;	
	draw_board = false;
	player_animation_speed = 0.05;
	player_speed *= 0.95;
	
	x+=lengthdir_x(player_speed,player_direction);
    y+=lengthdir_y(player_speed,player_direction);
	
	if player_animation_index >= player_animation_index_max{
		player_animation_index = 3;
		player_animation_speed = 0.25;
        change_sprite_sheet(id, s_riding_regular);
		player_rotation = jump_start_rotation;
        player_state_step = player_state_step_riding;
	}
	
	player_animation_index += player_animation_speed;
}


function player_state_step_riding() {
	vsp = 0;
	player_y_offset = 0;
	player_rotation_speed = 0.2;
	draw_board = false;
	player_speed = 2;
	board_animation = false;
    if keyboard_check_pressed(vk_space){
		change_sprite_sheet(id, s_riding_duck_regular);
		player_animation_index = 0;
		player_state_step = player_state_step_riding_duck;
	}
	
    if (keyboard_check(vk_right)) {
        player_rotation += player_rotation_speed;
        player_animation_index += player_animation_speed;
    }
    else if (keyboard_check(vk_left)) {
        player_rotation -= player_rotation_speed;
        player_animation_index -= player_animation_speed;
    }
    else{
		if (player_animation_index > 3) {
        player_animation_index -= player_animation_speed;
	    }
	    if (player_animation_index < 3) {
	        player_animation_index += player_animation_speed;
	    }	
    }

    var idx = (round(player_rotation) mod 31);
    player_direction = angle_for_frame[idx];


    x+=lengthdir_x(player_speed,player_direction);
    y+=lengthdir_y(player_speed,player_direction);

}


function player_state_step_riding_duck() {
    vsp = 0;
	player_speed += 0.1;
	if player_speed > 3{
		player_speed = 3;
	}
    if (!keyboard_check(vk_space)){
        // Player starts the trick (jump)
        change_sprite_sheet(id, s_trick_regular);
        player_animation_index = 0;
		board_rotation = player_rotation;	
        jump_start_rotation = player_rotation;
        
        vsp -= 6;
        player_state_step = player_state_step_trick;
    }
    
    if (keyboard_check(vk_right)) {
        player_rotation += player_rotation_speed;
    }
    else if (keyboard_check(vk_left)) {
        player_rotation -= player_rotation_speed;
    }
	
    player_animation_index += player_animation_speed;

    var idx = (round(player_rotation) mod 31);
    player_direction = angle_for_frame[idx];

    x += lengthdir_x(player_speed, player_direction);
    y += lengthdir_y(player_speed, player_direction);
}


function player_state_step_trick() {
    player_rotation_speed = 0.7;
    player_animation_index += player_animation_speed;
	draw_board = true;
	
    if (keyboard_check(vk_right)) {
        player_rotation += player_rotation_speed;
    }
    else if (keyboard_check(vk_left)) {
        player_rotation -= player_rotation_speed;
    }
	
	skate_tricks_trigger();
	
    x += lengthdir_x(player_speed, player_direction);
    y += lengthdir_y(player_speed, player_direction);
	
	
    if (player_animation_index >= player_animation_index_max) {
        change_sprite_sheet(id, s_fall_regular);
		player_animation_index = 0;
		player_state_step = player_state_fall;
    }
}


function player_state_fall() {
    player_rotation_speed = 0.7;
	draw_board = true;
	
	if vsp > 0 {
		player_animation_index += player_animation_speed;	
	}
	
    if (keyboard_check(vk_right)) {
        player_rotation += player_rotation_speed;
    }
    else if (keyboard_check(vk_left)) {
        player_rotation -= player_rotation_speed;
    }
	
	skate_tricks_trigger();
	
    x += lengthdir_x(player_speed, player_direction);
    y += lengthdir_y(player_speed, player_direction);
	
	
   if (player_y_offset > 0) {
	    var rot_diff = (player_rotation - jump_start_rotation) mod 31;
	    if (rot_diff < 0) rot_diff += 31; // Ensure rot_diff is positive
    
	    // Calculate the shortest distance in the cyclic range
	    var shortest_diff = min(rot_diff, 31 - rot_diff);
    
	    // Check if the player has landed a 180
	    if (abs(shortest_diff - 16) <= 5 && board_animation_index = 0 && board_rotation_check == false) {
	        // Correct 180 rotation adjustment
	        if (rot_diff <= 16) {
	            player_rotation = (player_rotation + 16) mod 31;
	        } else {
	            player_rotation = (player_rotation - 16 + 31) mod 31;
	        }
	        change_sprite_sheet(id, s_riding_regular);
	        player_state_step = player_state_step_riding;
	    }
	    // Check for normal land
	    else if (shortest_diff <= 5 && board_animation_index = 0 && board_rotation_check == false) {
	        player_animation_index = 3;
	        change_sprite_sheet(id, s_riding_regular);
	        player_state_step = player_state_step_riding;
	    }
	    // Bail logic
	    else {
	        player_animation_index = 0;
	        change_sprite_sheet(id, s_bail);
	        player_state_step = player_state_step_bail;
	    }
	}

	
	
	
	
	
	
	
	
}



function skate_tricks_trigger(){
	if (keyboard_check(ord("X"))) {
		board_animation = true;
	}	
	
	if (keyboard_check(ord("C")) && board_rotation_check == false) {
		board_rotation_check = true;
		board_rotation_start = board_rotation;
	}	
}




// Assign the current state function
player_state_step = player_state_step_riding;