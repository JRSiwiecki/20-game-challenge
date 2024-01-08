extends CharacterBody2D

class_name Paddle

@export var paddle_speed : float = 500.0

func _physics_process(delta: float) -> void:
	velocity.x = 0
	
	if Input.is_action_pressed("paddle_left"):
		velocity.x -= paddle_speed
	if Input.is_action_pressed("paddle_right"):
		velocity.x += paddle_speed
	
	move_and_slide()
