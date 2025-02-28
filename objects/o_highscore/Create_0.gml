var ini_path = "highscore.ini"; 
ini_open(ini_path);
global.highscore = ini_read_real("GameData", "highscore", 0);
ini_close();