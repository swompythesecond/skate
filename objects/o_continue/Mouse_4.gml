if (file_exists("save_data.ini")) {
	global.load_game = true;
	room_goto(ingame)
}