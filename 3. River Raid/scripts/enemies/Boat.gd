extends CharacterBody2D

class_name Boat

signal enemy_destroyed

@export var health_component : HealthComponent
@export var sprite : Sprite2D

@export var boat_speed : float = 300.0

func _physics_process(_delta: float) -> void:
	velocity.x = boat_speed
	
	move_and_slide()

# If body is not the missile, we don't care what collides with the boat.
func _on_hitbox_component_body_entered(body: Node2D) -> void:
	if body is TileMap:
		boat_speed = -boat_speed
		sprite.flip_h = !sprite.flip_h

func emit_unique_signal() -> void:
	enemy_destroyed.emit()
