// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_player_stance(this){
	if (this.player_stance == "_regular"){
		this.player_stance = "_switch";
	}
	else{
		this.player_stance = "_regular";
	}
}