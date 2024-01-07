extends Node2D

@export var pipe: PackedScene
@export var min_gap: float = 250.0
@export var max_gap: float = 350.0

@onready var score_label: Label = $"CanvasLayer/MarginContainer/Score Label"
@onready var high_score_label: Label = $"CanvasLayer/MarginContainer/High Score Label"

@onready var score_sound: AudioStreamPlayer = $"Score Scound"
@onready var lose_sound: AudioStreamPlayer = $"Lose Sound"

@onready var high_score: int = load_high_score()

# Need this or we will have 2 score when passing through first pipe
# and forever be ahead by 1 score.
var score: int = -1
 
# Add extra offset to screen width so pipe can't be seen while spawning
# Use halved screen height value so pipe is actually on screen
const SCREEN_WIDTH: float = 1152.0 + 200.0
const SCREEN_HEIGHT: float = 646.0 / 2.0

const SAVE_PATH: String = "user://savegame.save"

func _ready() -> void:
	spawn_pipes()
	update_high_score_text()

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
	update_high_score_text()
	update_score_text()

func update_high_score_text() -> void:
	high_score_label.text = "High Score: " + str(high_score)

func update_score_text() -> void:
	score_label.text = "Score: " + str(score)

func end_game() -> void:
	lose_sound.play()
	await save_high_score(score)
	await get_tree().create_timer(0.15).timeout
	get_tree().quit()

func save_high_score(current_score: int) -> void:
	if score <= high_score:
		return
	
	high_score = max(score, high_score)
	
	var save_game = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	save_game.store_var(high_score)

func load_high_score():
	# No save found
	if not FileAccess.file_exists(SAVE_PATH):
		return 0
	
	var save_game = FileAccess.open(SAVE_PATH, FileAccess.READ)
	return save_game.get_var(high_score)
