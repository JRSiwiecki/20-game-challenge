extends CharacterBody2D

@export var jump_height: float = -300.0
@export var gravity: float = 980.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = jump_height
	
	velocity.y +=  gravity * delta
	
	move_and_slide()
