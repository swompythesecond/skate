
if draw_board == true{
	draw_spritesheet_frame_board(round(board_rotation), board_animation_index, board_sprite_width, board_sprite_height, x-board_sprite_width/2, y-board_sprite_height/2+25+player_y_offset);
	
	draw_spritesheet_frame_board_shadow(round(board_rotation), board_animation_index, board_sprite_width, board_sprite_height, x-board_sprite_width/2, (y-board_sprite_height/2+25)-(ground_height-start_ground_height));
}

draw_spritesheet_frame(player_spritesheet, round(player_rotation), round(player_animation_index), player_sprite_width, player_sprite_height, x-sprite_get_width(sprite_index)/2, y-sprite_get_height(sprite_index)/2+player_y_offset);





