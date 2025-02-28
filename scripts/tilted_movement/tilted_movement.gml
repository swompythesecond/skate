// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tilted_movement(){
	if player_tilt = "_tilted_down"{
		y-=angle_match(270, player_rotation*11.25)*(player_base_speed/2.9);
		z = ground_height;
		start_ground_height = ground_height;
	}
	if player_tilt = "_tilted_right"{
		y+=angle_match(315, player_rotation*11.25)*(player_base_speed/2.9);
		z = ground_height;
		start_ground_height = ground_height;
	}
	if player_tilt = "_tilted_left"{
		y-=angle_match(135, player_rotation*11.25)*(player_base_speed/2.9);
		z = ground_height;
		start_ground_height = ground_height;
	}
	if player_tilt = "_tilted_up"{
		y+=angle_match(45, player_rotation*11.25)*(player_base_speed/2.9);
		z = ground_height;
		start_ground_height = ground_height;
	}
}