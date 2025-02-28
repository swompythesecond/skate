// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fall_check(){
	if z > ground_height{
		board_rotation = player_rotation;	
        jump_start_rotation = player_rotation;
		change_player_state_step_fall();
	}
}