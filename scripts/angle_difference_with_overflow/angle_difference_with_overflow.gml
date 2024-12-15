// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function angle_difference_with_overflow(angle_1, angle_2, max_angle) {
    var diff = abs(angle_2 - angle_1); // Absolute difference

    // Handle overflow by wrapping around
    if (diff > max_angle / 2) {
        diff = max_angle - diff;
    }

    return diff;
}