// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_height_tilted(angle,xx,yy){
	var count = 0;
	var ground_height = 0;
	var tilted_object = collision_point(xx,yy,o_tilted_parent, true, false);
	if tilted_object != noone{
		ground_height = tilted_object.ground_height;
	}
	else{
		return 0;	
	}
	while(collision_point(xx,yy,o_tilted_parent, true, false)){
		count ++;
		xx+=lengthdir_x(1,angle);
		yy+=lengthdir_y(1,angle);
	}
	return ground_height + count/2.9;
	
}