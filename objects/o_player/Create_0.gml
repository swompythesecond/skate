player_sprite_width = 75;
player_sprite_height = 75;

depth = 10;
alarm[0] = 60;


draw_board = false;
player_rotation = 0;
player_stance = "_regular";
player_tilt = "";
player_spritesheet = s_riding_regular;
player_rotation_max = (sprite_get_width(player_spritesheet)/player_sprite_width)-1;
change_sprite_sheet(id, "s_riding");
pressed_forward = 0;


player_rotation_speed = 0.25;

player_animation_index = 3;
player_animation_speed = 0.25;
player_base_speed = 2.8;
player_speed = player_base_speed;
player_base_speed_duck = 3.6;
player_direction = 0;

jump_power = 6;

player_y_offset = 0;
ground_height = 0;
start_ground_height = 0;
z = 0;
vsp = 0;
grv = 0.3;


last_safe_x = x;
last_safe_y = y;
last_safe_z = z;

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

trick_score = 0;
current_trick_score = 0;
current_trick_array = [];
current_trick_rotation = 0;
failed_trick_text = "";

button_up = false;
button_left = false;
button_right = false;

button_x = false;
button_a = false;
button_b = false;


timer = 18000;
draw_menu = false;

land_timer = 0;

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
		player_animation_speed = 0.25;
		change_player_state_step_standing();
	}
	
	player_animation_index += player_animation_speed;
}


function player_state_step_bail_in_place() {
	vsp = 0;
	player_y_offset = 0;	
	draw_board = false;
	player_animation_speed = 0.2;
	
	if player_animation_index >= player_animation_index_max{
		x = last_safe_x;
		y = last_safe_y;
		z = last_safe_z;
		player_animation_speed = 0.25;
		change_player_state_step_standing();
	}
	
	player_animation_index += player_animation_speed;
}


function player_state_step_riding() {
	vsp = 0;
	player_y_offset = 0;
	player_rotation_speed = 0.2;
	draw_board = false;
	player_speed = player_base_speed;
	board_animation = false;
    if button_a{
		change_player_state_step_duck();
	}
	
    if (button_right) {
        player_rotation += player_rotation_speed;
        player_animation_index += player_animation_speed;
    }
    else if (button_left) {
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
	
	
	tilted_movement();
	tilt_check();
	wall_check();
	fall_check();

}


function player_state_step_standing() {
	vsp = 0;
	player_y_offset = 0;
	player_rotation_speed = 0.5;
	draw_board = false;
	player_speed = 0;
	board_animation = false;
	
	if (button_up) {
        pressed_forward = true;
    }
	
    if (button_right) {
        player_rotation += player_rotation_speed;
    }
    else if (button_left) {
        player_rotation -= player_rotation_speed;
    }
	
	if pressed_forward {
		player_animation_index += player_animation_speed;
	}
	
	if player_animation_index >= player_animation_index_max{
		change_player_state_step_riding();
	}


}

function player_state_step_land() {
	vsp = 0;
	player_y_offset = 0;
	player_rotation_speed = 0.2;
	draw_board = false;
	player_speed = player_base_speed;
	board_animation = false;
	
	
	player_animation_index += player_animation_speed;
    if (button_right) {
        player_rotation += player_rotation_speed;
        
    }
    else if (button_left) {
        player_rotation -= player_rotation_speed;
    }
   

    var idx = (round(player_rotation) mod 31);
    player_direction = angle_for_frame[idx];


    x+=lengthdir_x(player_speed,player_direction);
    y+=lengthdir_y(player_speed,player_direction);
	
	if player_animation_index >= player_animation_index_max{
		player_animation_index = 3;
		 change_sprite_sheet(id, "s_riding");
	     player_state_step = player_state_step_riding;
	}
	
	tilt_check()
	tilted_movement();
	wall_check();
	fall_check();

}


function player_state_step_riding_duck() {
    vsp = 0;
	player_speed += 0.1;
	if player_speed > player_base_speed_duck{
		player_speed = player_base_speed_duck;
	}
    if (!button_a){
        // Player starts the trick (jump)
        change_player_state_step_trick();
    }
    
    if (button_right) {
        player_rotation += player_rotation_speed;
    }
    else if (button_left) {
        player_rotation -= player_rotation_speed;
    }
	
    player_animation_index += player_animation_speed;

    var idx = (round(player_rotation) mod 31);
    player_direction = angle_for_frame[idx];

    x += lengthdir_x(player_speed, player_direction);
    y += lengthdir_y(player_speed, player_direction);
	tilt_check()
	tilted_movement();
	wall_check();
	fall_check();
}


function player_state_step_trick() {
    player_rotation_speed = 0.7;
    player_animation_index += player_animation_speed;
	draw_board = true;
	
    if (button_right) {
        player_rotation += player_rotation_speed;
		current_trick_rotation += player_rotation_speed;
    }
    else if (button_left) {
        player_rotation -= player_rotation_speed;
		current_trick_rotation -= player_rotation_speed;
    }
	
	skate_tricks_trigger();
	
    x += lengthdir_x(player_speed, player_direction);
    y += lengthdir_y(player_speed, player_direction);
	
	
	wall_check();
	
    if (player_animation_index >= player_animation_index_max) {
        change_player_state_step_fall();
    }
}


function player_state_fall() {
    player_rotation_speed = 0.7;
	draw_board = true;
	
	
	if vsp > 0 {
		player_animation_index += player_animation_speed;	
	}
	
    if (button_right) {
        player_rotation += player_rotation_speed;
		current_trick_rotation += player_rotation_speed;
    }
    else if (button_left) {
        player_rotation -= player_rotation_speed;
		current_trick_rotation -= player_rotation_speed;
    }
	

	skate_tricks_trigger();
	
    x += lengthdir_x(player_speed, player_direction);
    y += lengthdir_y(player_speed, player_direction);
	
	
   if (z <= ground_height) {
	    var rot_diff = (player_rotation - jump_start_rotation) mod 31;
	    if (rot_diff < 0) rot_diff += 31; // Ensure rot_diff is positive
		
	    // Calculate the shortest distance in the cyclic range
	    var shortest_diff = min(rot_diff, 31 - rot_diff);
		player_animation_index = 0;
		player_y_offset-=ground_height-z;
		z = ground_height;
		start_ground_height = ground_height;
		y+=player_y_offset;
		vsp = 0;
		player_y_offset = 0;
		
		wall_check();
		
	    // Check if the player has landed a 180
	    if (abs(shortest_diff - 16) <= 5 && board_animation_index = 0 && board_rotation_check == false) {
	        // Correct 180 rotation adjustment
	        if (rot_diff <= 16) {
	            player_rotation = (player_rotation + 16) mod 31;
	        } else {
	            player_rotation = (player_rotation - 16 + 31) mod 31;
	        }
			change_player_stance(id);
	        change_player_state_step_land();
	    }
	    // Check for normal land
	    else if (shortest_diff <= 5 && board_animation_index = 0 && board_rotation_check == false) {
	        change_player_state_step_land();
	    }
	    // Bail logic
	    else {
	        change_player_state_step_bail();
	    }
		
		
	}

	
	
	
	
	
	
	
	
}



function skate_tricks_trigger(){
	if (button_x) && board_animation == false {
		board_animation = true;
		current_trick_score += 30;
		current_trick_array[array_length(current_trick_array)] = "kickflip";
	}	
	
	if (button_b) && board_rotation_check == false {
		board_rotation_check = true;
		board_rotation_start = board_rotation;
		current_trick_array[array_length(current_trick_array)] = "shuvit";
		current_trick_score += 25;
	}
	
	if current_trick_rotation > 14{
		current_trick_rotation -= 14;
		current_trick_array[array_length(current_trick_array)] = "backside 180";
		current_trick_score += 20;
	}
	
	if current_trick_rotation < -14{
		current_trick_rotation += 14;
		current_trick_array[array_length(current_trick_array)] = "frontside 180";
		current_trick_score += 20;
	}
}


function wall_check(){
	var target_x = x;
	var target_y = y+25;


	var _wall = collision_point(target_x,target_y, o_wall_parent, 1, 0);

	if _wall != noone {
		if _wall.height > z && start_ground_height < _wall.height {
			change_player_state_step_bail_in_place();
		}
	}
	else{
			last_safe_x = x;
			last_safe_y = y;
			
			if player_y_offset == 0{
			 last_safe_z = z;	
			}
	}
}

function tilt_check(){
		var _tilt = collision_point(x,y+25, o_tilted_parent, 1, 0);
		var _last_tilt = player_tilt;
		if _tilt != noone {
			player_tilt = _tilt.tilt;
		}
		else{
			player_tilt = "";
		}
		
		if _last_tilt != player_tilt{
			if player_tilt == ""{
				ground_check()
				z = ground_height;
				start_ground_height = ground_height;
			}
			change_sprite_sheet(id, player_sprite_sheet_name);
		}
}

// Assign the current state function
player_state_step = player_state_step_riding;

change_player_state_step_standing();


function save_game() {
    var ini_path = "save_data.ini"; // Define the INI file name

    ini_open(ini_path); // Open the INI file

    // Save game variables
    ini_write_real("GameData", "x", x);
    ini_write_real("GameData", "y", y);
    ini_write_real("GameData", "z", ground_height);
    ini_write_real("GameData", "timer", timer);
    ini_write_real("GameData", "trick_score", trick_score);

    ini_close(); // Close the INI file
}


function load_game() {
    var ini_path = "save_data.ini"; // Define the INI file name

    if (file_exists(ini_path)) { // Check if the save file exists
        ini_open(ini_path); // Open the INI file

        // Load game variables
        x = ini_read_real("GameData", "x", 0);
        y = ini_read_real("GameData", "y", 0);
        z = ini_read_real("GameData", "z", 0);
        timer = ini_read_real("GameData", "timer", 0);
        trick_score = ini_read_real("GameData", "trick_score", 0);

        ini_close(); // Close the INI file
    } else {
    }
}



if global.load_game == true{
	load_game();	
}