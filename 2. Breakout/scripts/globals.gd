extends Node

enum Object_Hit {WALL, BRICK, PADDLE}

var score : int
var high_score : int

var lives : int = 3

func increment_score() -> void:
	score += 1

func decrement_lives() -> void:
	lives -= 1
