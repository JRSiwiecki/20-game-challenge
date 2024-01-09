extends CharacterBody2D

class_name Jet

@export var animation : AnimatedSprite2D

@export var MAX_SPEED : float = 500.0

var speed : float = 400.0

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("left"):
		velocity.x += -speed
		
		if animation.animation != "full_lean_left":
			animation.play("lean_left")
	
	elif Input.is_action_pressed("right"):
		velocity.x += speed
		
		if animation.animation != "full_lean_right":
			animation.play("lean_right")
	
	else:
		if animation.animation != "full_forward":
			animation.play("forward")
	
	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	if animation.animation == "lean_left":
		animation.play("full_lean_left")
	elif animation.animation == "lean_right":
		animation.play("full_lean_right")
	elif animation.animation == "forward":
		animation.play("full_forward")
