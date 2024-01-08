extends StaticBody2D

class_name Brick

func _on_ball_detector_body_entered(body: Node2D) -> void:
	if body.name != "Ball":
		return
	
	body.bounce(Ball.Side_Of_Ball_Hit.BOTTOM, Globals.Object_Hit.BRICK)
	queue_free()
