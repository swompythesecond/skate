function draw_spritesheet_frame_board_shadow(rotation_index, animation_index, frame_width, frame_height, _x, _y){

var x_source = animation_index * frame_width;
var y_source = frame_height*2;

draw_sprite_part_ext(
    asset_get_index("board_Dir"+string(rotation_index)),
    0,
    x_source,
    y_source,
    frame_width,
    frame_height,
    _x, _y,
	1,
	1,
	c_black,
	0.5
);




}