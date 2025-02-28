// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_player_state_step_land(){
	change_sprite_sheet(id, "s_land");
	land_timer = 3;
	trick_score += current_trick_score * array_length(current_trick_array);
	tilt_check();
	player_state_step = player_state_step_land;
}