extends Node2D

func _process(delta: float) -> void:
	position.x += Globals.scroll_speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Bird":
		get_tree().quit()
