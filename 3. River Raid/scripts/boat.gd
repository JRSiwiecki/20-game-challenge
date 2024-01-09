extends CharacterBody2D

@export var health_component : HealthComponent

# If body is not the missile, we don't care what collides with the boat.
func _on_hitbox_component_body_entered(body: Node2D) -> void:
	if body.name != "Missile":
		return
	
	health_component.damage()
