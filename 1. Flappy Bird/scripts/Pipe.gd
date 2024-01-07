extends Node2D

func _process(delta: float) -> void:
	position.x += Globals.scroll_speed * delta
	
	if position.x <= -100.0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Bird":
		get_node("/root/Game").end_game()
