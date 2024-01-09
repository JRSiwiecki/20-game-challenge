extends Area2D

class_name HitboxComponent

@export var health_component : HealthComponent

func damage() -> void:
	if not health_component:
		return
	
	health_component.damage()
