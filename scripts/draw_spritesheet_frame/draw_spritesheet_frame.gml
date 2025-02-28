// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_spritesheet_frame(spritesheet, rotation_index, animation_index, frame_width, frame_height, _x, _y){

var x_source = rotation_index * frame_width;
var y_source = animation_index * frame_height;


draw_sprite_part(
    spritesheet,
    0,
    x_source,
    y_source,
    frame_width,
    frame_height,
    _x, _y
);



}