extends StaticBody2D

class_name Fuel

signal fuel_destroyed

@export var health_component : HealthComponent

func emit_unique_signal() -> void:
	fuel_destroyed.emit()
