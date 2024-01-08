extends Node2D

func _on_top_wall_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.bounce(body.Side_Of_Ball_Hit.TOP, Globals.Object_Hit.WALL)

func _on_bottom_wall_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.queue_free()

func _on_left_wall_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.bounce(body.Side_Of_Ball_Hit.LEFT, Globals.Object_Hit.WALL)

func _on_right_wall_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.bounce(body.Side_Of_Ball_Hit.RIGHT, Globals.Object_Hit.WALL)
