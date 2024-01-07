extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Bird":
		get_tree().quit()
