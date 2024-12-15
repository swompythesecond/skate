// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_angle_without_overflow(angle, overflow) {
    return (angle % overflow + overflow) % overflow;
}