extends Node

enum Object_Hit {WALL, BRICK, PADDLE}

var score : int = 0
var high_score : int = load_high_score()
var lives : int = 3

const SAVE_PATH: String = "user://savegame.save"

func increment_score() -> void:
	score += 1

func decrement_lives() -> void:
	lives -= 1

func save_high_score() -> void:
	if score <= high_score:
		return
	
	high_score = score
	
	var save_game = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	save_game.store_var(high_score)

func load_high_score() -> int:
	# No save found
	if not FileAccess.file_exists(SAVE_PATH):
		return 0 
	
	var save_game = FileAccess.open(SAVE_PATH, FileAccess.READ)
	return save_game.get_var(high_score)

func end_game() -> void:
	save_high_score()
	get_tree().quit()
