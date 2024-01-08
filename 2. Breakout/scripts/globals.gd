extends Node

enum Object_Hit {WALL, BRICK, PADDLE}

var score : int
var high_score : int

func increment_score() -> void:
	score += 1
