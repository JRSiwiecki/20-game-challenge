extends Control

@export var ball : PackedScene
@export var score_label : Label

func _on_ball_score_updated() -> void:
	score_label.text = "Score: " + str(Globals.score)
