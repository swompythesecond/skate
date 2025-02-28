// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_trick_text(_array){
	var _trick_text = "";
	if array_length(_array) > 0{

		_trick_text = _array[0];
		for (var i = 1; i < array_length(_array); i++){
			_trick_text += "+" + _array[i];
		}

	}
	return _trick_text;
}