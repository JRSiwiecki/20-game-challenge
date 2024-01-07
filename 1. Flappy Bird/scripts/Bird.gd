extends CharacterBody2D

@export var bird_speed: float = 10.0
@export var jump_height: float = -300.0
@export var gravity: float = 980.0

func _physics_process(delta: float) -> void:
	velocity.x = bird_speed
	
	if Input.is_action_just_pressed("fly"):
		velocity.y = jump_height
	
	velocity.y +=  gravity * delta
	
	move_and_slide()
