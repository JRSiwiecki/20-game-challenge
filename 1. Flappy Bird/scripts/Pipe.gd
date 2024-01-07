extends Node2D

@export var scroll_speed: float = -100.0

func _process(delta: float) -> void:
	position.x += scroll_speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Bird":
		get_tree().quit()
