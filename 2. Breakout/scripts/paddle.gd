extends CharacterBody2D

class_name Paddle

@export var paddle_speed : float = 500.0
@export var scale_decrement : float = 0.025

@export var paddle_hit : AudioStreamPlayer

var x_scale : float = 1.0

func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("paddle_left"):
		velocity.x -= paddle_speed
	if Input.is_action_pressed("paddle_right"):
		velocity.x += paddle_speed
	
	move_and_slide()

func _on_ball_detector_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.bounce(Ball.Side_Of_Ball_Hit.BOTTOM, Globals.Object_Hit.PADDLE)
	paddle_hit.play()

func shrink_paddle() -> void:
	x_scale -= scale_decrement
	scale = Vector2(x_scale, 1)
