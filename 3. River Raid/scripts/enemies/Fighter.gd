extends CharacterBody2D

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

# If body is not the missile or jet, we don't care what collides with the fighter.
func _on_hitbox_component_body_entered(body: Node2D) -> void:
	if body.name != "Missile":
		return
	
	health_component.damage()
