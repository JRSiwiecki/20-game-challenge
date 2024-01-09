extends CharacterBody2D

class_name Jet

@export var animation : AnimatedSprite2D

@export var MAX_SPEED : float = 500.0

var speed : float = Globals.scroll_speed

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed)
	
	if Input.is_action_pressed("forward"):
		velocity.y -= speed
	
	if Input.is_action_pressed("left"):
		velocity.x += -speed
		animation.play("lean_left")
	
	elif Input.is_action_pressed("right"):
		velocity.x += speed
		animation.play("lean_right")
	
	else:
		animation.play("forward")
	
	move_and_slide()
