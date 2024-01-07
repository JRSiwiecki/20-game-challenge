extends Node2D

@export var pipe: PackedScene
@export var min_gap: float = 250.0
@export var max_gap: float = 350.0
 
# Use halved screen height value so pipe is actually on screen
const SCREEN_WIDTH: float = 1152.0
const SCREEN_HEIGHT: float = 646.0 / 2.0

func _on_timer_timeout() -> void:
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
