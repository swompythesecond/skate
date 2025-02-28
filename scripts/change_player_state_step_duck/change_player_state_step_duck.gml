// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_player_state_step_duck(){
	change_sprite_sheet(id, "s_riding_duck");
		player_animation_index = 0;
		player_state_step = player_state_step_riding_duck;
}