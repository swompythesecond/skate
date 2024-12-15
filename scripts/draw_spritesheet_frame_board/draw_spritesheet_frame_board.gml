// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_spritesheet_frame_board(rotation_index, animation_index, frame_width, frame_height, _x, _y){

var x_source = animation_index * frame_width;
var y_source = frame_height*2;

draw_sprite_part(
    asset_get_index("board_Dir"+string(rotation_index)),
    0,
    x_source,
    y_source,
    frame_width,
    frame_height,
    _x, _y
);




}