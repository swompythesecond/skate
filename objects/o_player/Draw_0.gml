// Draw the specific frame of the spritesheet
draw_spritesheet_frame(player_spritesheet, round(player_rotation), round(player_animation_index), player_sprite_width, player_sprite_height, x-sprite_get_width(sprite_index)/2, y-sprite_get_height(sprite_index)*0.8);


draw_set_color(c_red)
draw_text(100,100,floor(player_rotation));


draw_line(x,y,x+lengthdir_x(25,player_direction), y+lengthdir_y(25,player_direction))