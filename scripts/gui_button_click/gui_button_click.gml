// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gui_button_click(btn_x, btn_y, sprite){
    var btn_w = sprite_get_width(sprite);
    var btn_h = sprite_get_height(sprite);

    // Draw the sprite (button)
    draw_sprite(sprite, 0, btn_x, btn_y);

    // Check for input on the button
    var pressed = false;

    // Loop through possible touch inputs (0-4 is typical max in GameMaker)
    for (var i = 0; i < 5; i++) {
        if (device_mouse_check_button(i, mb_left)) { // Check if this touch index is active
            var tx = device_mouse_x_to_gui(i);
            var ty = device_mouse_y_to_gui(i);

            if (tx > btn_x && tx < btn_x + btn_w &&
                ty > btn_y && ty < btn_y + btn_h) {
                pressed = true;
            }
        }
    }

    return pressed;
}