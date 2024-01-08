extends Control

@export var ball : PackedScene
@export var score_label : Label
@export var lives_label: Label

func _on_ball_score_updated() -> void:
	score_label.text = "Score: " + str(Globals.score)


func _on_ball_lives_updated() -> void:
	lives_label.text = "Lives: " + str(Globals.lives)
