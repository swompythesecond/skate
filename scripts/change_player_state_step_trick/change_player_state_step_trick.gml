// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_player_state_step_trick(){
	change_sprite_sheet(id, "s_trick");
    player_animation_index = 0;
	board_rotation = player_rotation;	
    jump_start_rotation = player_rotation;
    start_ground_height = ground_height;
    vsp -= jump_power;
	
	current_trick_score = 0;
	current_trick_array = [];
	current_trick_rotation = 0;
	failed_trick_text = "";
    player_state_step = player_state_step_trick;
}