extends CharacterBody2D

class_name Helicopter

signal enemy_destroyed

@export var health_component : HealthComponent
@export var sprite : Sprite2D

@export var helicopter_speed : float = 400.0

func _physics_process(_delta: float) -> void:
	velocity.x = helicopter_speed
	
	move_and_slide()

# If body is not the missile, we don't care what collides with the helicopter.
func _on_hitbox_component_body_entered(body: Node2D) -> void:
	if body.name == "TileMap":
		helicopter_speed = -helicopter_speed
		sprite.flip_h = !sprite.flip_h
		
	
	if body.name != "Missile":
		return
	
	health_component.damage()
	enemy_destroyed.emit()
