// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_sprite_sheet(this, new_spritesheet_name, no_stance = false){
	var _old_player_rotation_max = this.player_rotation_max;
	var _tilt = "";
	if new_spritesheet_name == "s_riding" || new_spritesheet_name == "s_riding_duck" || new_spritesheet_name == "s_land"{
		_tilt = player_tilt;
	}
	player_sprite_sheet_name = new_spritesheet_name;
	this.player_spritesheet = asset_get_index(new_spritesheet_name+this.player_stance+_tilt);
	
	if no_stance == true{
		this.player_spritesheet = asset_get_index(new_spritesheet_name);
	}
	
	this.player_rotation_max = (sprite_get_width(this.player_spritesheet)/this.player_sprite_width)-1;
	this.player_animation_index_max = (sprite_get_height(this.player_spritesheet)/this.player_sprite_height)-1;

	this.player_rotation = this.player_rotation*(this.player_rotation_max/_old_player_rotation_max)
}