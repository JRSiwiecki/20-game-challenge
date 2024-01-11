extends CharacterBody2D

class_name Fighter

signal enemy_destroyed

@export var health_component : HealthComponent

@export var fighter_speed : float = 300.0

const CAMERA_OFFSET : float = 100.0

func _physics_process(_delta: float) -> void:
	if position.x <= (Globals.CAMERA_LEFT_LIMIT - CAMERA_OFFSET):
		position.x = Globals.CAMERA_RIGHT_LIMIT + CAMERA_OFFSET
	elif position.x >= (Globals.CAMERA_RIGHT_LIMIT + CAMERA_OFFSET):
		position.x = Globals.CAMERA_LEFT_LIMIT - CAMERA_OFFSET
	
	velocity.x = fighter_speed
	move_and_slide()

func emit_unique_signal() -> void:
	enemy_destroyed.emit()
