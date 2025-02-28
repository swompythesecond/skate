draw_set_font(ft_pixel);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var trick_text_x = view_get_wport(0) * 0.5; 
var trick_text_y = view_get_hport(0)* 0.9;
var trick_score_x = trick_text_x;
var trick_score_y = view_get_hport(0)* 0.95;

var _trick_score = "";
if array_length(current_trick_array) > 0{
	_trick_score = string(current_trick_score) + " x" + string(array_length(current_trick_array));
}

if (failed_trick_text != "") {
    draw_set_color(c_red);
    draw_text_transformed(trick_text_x, trick_text_y, failed_trick_text,0.5,0.5,0);
	draw_text_transformed(trick_score_x, trick_score_y, _trick_score,0.8,0.8,0);
} else {
    var _trick_text = get_trick_text(current_trick_array);
    draw_set_color(c_white);
    draw_text_transformed(trick_text_x, trick_text_y, _trick_text,0.5,0.5,0);
	draw_text_transformed(trick_score_x, trick_score_y, _trick_score,0.8,0.8,0);
}





draw_set_color(c_black);

var score_x = view_get_wport(0) * 0.5; 
var score_y = view_get_hport(0)* 0.1;
draw_text(score_x, score_y, trick_score);



var timer_x = view_get_wport(0) * 0.1;
var timer_y = view_get_hport(0) * 0.1;

var total_seconds = timer div 60;
var minutes = total_seconds div 60;
var seconds = total_seconds mod 60;

var seconds_str = string(seconds);
if (seconds < 10) {
    seconds_str = "0" + seconds_str;
}

draw_text(timer_x, timer_y, string(minutes) + ":" + seconds_str);

var btn_menu_x = view_get_wport(0) * 0.8;
var btn_menu_y = view_get_hport(0) * 0.05;

if gui_button_click(btn_menu_x, btn_menu_y, s_menu){
	draw_menu = true;
}

if draw_menu{
	draw_set_color(c_gray);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,view_get_wport(0), view_get_hport(0), 0)
	draw_set_alpha(1);
	
	
	var btn_resume_x = view_get_wport(0) * 0.45;
	var btn_resume_y = view_get_hport(0) * 0.4;

	if gui_button_click(btn_resume_x, btn_resume_y, s_resume){
		draw_menu = false;
	}
	
	
	var btn_exit_x = view_get_wport(0) * 0.45;
	var btn_exit_y = view_get_hport(0) * 0.55;

	if gui_button_click(btn_exit_x, btn_exit_y, s_exit){
		save_game();
		room_goto(menu);
	}
}	




var btn_up_x = view_get_wport(0) * 0.1;
var btn_up_y = view_get_hport(0) * 0.65;

button_up = false;
if gui_button_click(btn_up_x, btn_up_y, s_controlls_up){
	button_up = true;
}

var btn_left_x = view_get_wport(0) * 0.045;
var btn_left_y = view_get_hport(0) * 0.77;

button_left = false;
if gui_button_click(btn_left_x, btn_left_y, s_controlls_left){
	button_left = true;
}


var btn_right_x = view_get_wport(0) * 0.155;
var btn_right_y = view_get_hport(0) * 0.77;

button_right = false;
if gui_button_click(btn_right_x, btn_right_y, s_controlls_right){
	button_right = true;
}


var btn_a_x = view_get_wport(0) * 0.87;
var btn_a_y = view_get_hport(0) * 0.8;

button_a = false;
if gui_button_click(btn_a_x, btn_a_y, s_button_a){
	button_a = true;
}


var btn_b_x = view_get_wport(0) * 0.92;
var btn_b_y = view_get_hport(0) * 0.70;

button_b = false;
if gui_button_click(btn_b_x, btn_b_y, s_button_b){
	button_b = true;
}


var btn_x_x = view_get_wport(0) * 0.82;
var btn_x_y = view_get_hport(0) * 0.70;

button_x = false;
if gui_button_click(btn_x_x, btn_x_y, s_button_x){
	button_x = true;
}





