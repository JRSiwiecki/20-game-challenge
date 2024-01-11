extends Node2D

class_name HealthComponent

func damage() -> void:
	get_parent().emit_unique_signal()
	get_parent().queue_free()
