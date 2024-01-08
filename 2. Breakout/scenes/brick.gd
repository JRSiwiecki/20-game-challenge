extends StaticBody2D

class_name Brick

func _on_ball_detector_body_entered(body: Node2D) -> void:
	if body.name == "Brick":
		return
	
	body.velocity.y *= -1
	queue_free()
