extends StaticBody2D

class_name Bridge

signal bridge_destroyed

@export var health_component : HealthComponent

func emit_unique_signal() -> void:
	bridge_destroyed.emit()
