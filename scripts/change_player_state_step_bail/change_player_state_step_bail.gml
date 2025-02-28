// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_player_state_step_bail(){
	change_sprite_sheet(id, "s_bail", true);
	player_animation_index = 0;
	failed_trick_text = get_trick_text(current_trick_array);
	player_state_step = player_state_step_bail;
}