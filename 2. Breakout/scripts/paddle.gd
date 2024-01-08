extends CharacterBody2D

class_name Paddle

@export var paddle_speed : float = 500.0

const LEFT_BOUND : float = 0.0
const RIGHT_BOUND : float = 200.0

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("paddle_left"):
		velocity.x -= paddle_speed
	if Input.is_action_pressed("paddle_right"):
		velocity.x += paddle_speed
	
	move_and_slide()


func _on_ball_detector_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.bounce(body.Side_Of_Ball_Hit.BOTTOM)
