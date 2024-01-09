extends CharacterBody2D

class_name Jet

@export var animation : AnimatedSprite2D

var speed : float = Globals.scroll_speed

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed)
	
	if Input.is_action_pressed("forward"):
		Globals.increase_scroll_speed()
		velocity.y -= speed
	
	if Input.is_action_just_released("forward"):
		Globals.reset_scroll_speed()
	
	if Input.is_action_pressed("left"):
		velocity.x += -speed
		animation.play("lean_left")
	
	elif Input.is_action_pressed("right"):
		velocity.x += speed
		animation.play("lean_right")
	
	else:
		animation.play("forward")
	
	move_and_slide()
