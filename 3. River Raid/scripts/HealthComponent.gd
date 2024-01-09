extends Node2D
class_name HealthComponent

func damage() -> void:
	get_parent().queue_free()
