// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ground_check(){
	if land_timer > 0 {
		return;	
	}
	
	var target = self;
	var target_x = target.x;
	var target_y = target.y + player_y_offset;
	var _tilt = collision_point(x,y+25, o_tilted_parent, 1, 0);
	if _tilt != noone {
		if _tilt.tilt = "_tilted_down"{
			ground_height = find_height_tilted(225, x, target_y+25);	
		}
		if _tilt.tilt = "_tilted_right"{
			ground_height = find_height_tilted(315, x, target_y+25);
		}
		if _tilt.tilt = "_tilted_left"{
			ground_height = find_height_tilted(135, x, target_y+25);	
		}
		if _tilt.tilt = "_tilted_up"{
			ground_height = find_height_tilted(45, x, target_y+25);	
		}
		return;
	}
	
	var _ground = collision_point(target_x,target_y+25, o_height_parent, true, 0);

	if _ground == noone {
		ground_height = 0;
	}
	else{
		ground_height = _ground.height;
	}
}