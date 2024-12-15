// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_sprite_sheet(this, new_spritesheet){
	var _old_player_rotation_max = this.player_rotation_max;
	
	this.player_spritesheet = new_spritesheet
	this.player_rotation_max = (sprite_get_width(this.player_spritesheet)/this.player_sprite_width)-1;
	this.player_animation_index_max = (sprite_get_height(this.player_spritesheet)/this.player_sprite_height)-1;

	this.player_rotation =this.player_rotation*(this.player_rotation_max/_old_player_rotation_max)
}