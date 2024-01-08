extends StaticBody2D

class_name Brick

@export var brick_hit : AudioStreamPlayer

func _on_ball_detector_body_entered(body: Node2D) -> void:
	if body.name != "Ball":
		return
	
	body.bounce(Ball.Side_Of_Ball_Hit.BOTTOM, Globals.Object_Hit.BRICK)
	brick_hit.play()

func _on_brick_hit_finished() -> void:
	queue_free()
