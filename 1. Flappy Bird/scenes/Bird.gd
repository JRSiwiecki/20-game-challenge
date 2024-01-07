extends CharacterBody2D

@export var bird_speed: float = 100

func _physics_process(delta: float) -> void:
	position.x += bird_speed * delta
