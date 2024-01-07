extends Node2D

@export var pipe: PackedScene
@export var min_gap: float = 250.0
@export var max_gap: float = 350.0

@onready var score_label: Label = $CanvasLayer/MarginContainer/Label
@onready var score_sound: AudioStreamPlayer = $"Score Scound"

# Need this or we will have 2 score when passing through first pipe
# and forever be ahead by 1 score.
var score: int = -1
 
# Add extra offset to screen width so pipe can't be seen while spawning
# Use halved screen height value so pipe is actually on screen
const SCREEN_WIDTH: float = 1152.0 + 200.0
const SCREEN_HEIGHT: float = 646.0 / 2.0

func _ready() -> void:
	spawn_pipes()

func _on_timer_timeout() -> void:
	spawn_pipes()
	increment_score()
	play_sound()
	update_ui()

func spawn_pipes() -> void:
	# Spawn pipes on timeout
	var top_pipe: Node2D = pipe.instantiate()
	var bottom_pipe: Node2D = pipe.instantiate()
	
	add_child(top_pipe)
	add_child(bottom_pipe)
	
	var gap: float = randf_range(min_gap, max_gap)
	
	bottom_pipe.set_rotation_degrees(180)
	
	top_pipe.position.x = SCREEN_WIDTH
	bottom_pipe.position.x = SCREEN_WIDTH
	
	top_pipe.position.y = SCREEN_HEIGHT - gap
	bottom_pipe.position.y = SCREEN_HEIGHT + gap

func increment_score() -> void:
	score += 1

func play_sound() -> void:
	# One off check that I don't like so we don't play sounds before
	# passing through first pipe.
	if score <= 0:
		return
	
	score_sound.play()

func update_ui() -> void:
	score_label.text = "Score: " + str(score)
