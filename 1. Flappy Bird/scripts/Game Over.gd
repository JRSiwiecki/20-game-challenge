extends Node2D

@onready var high_score_label: Label = $"CanvasLayer/VBoxContainer/High Score Label"
@onready var last_score_label: Label = $"CanvasLayer/VBoxContainer/Current Score Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	high_score_label.text = "High Score: " + str(Globals.high_score)
	last_score_label.text = "Last Score: " + str(Globals.score)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
