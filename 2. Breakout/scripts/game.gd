extends Node2D

@export var wall_hit : AudioStreamPlayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_top_wall_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.bounce(Ball.Side_Of_Ball_Hit.TOP, Globals.Object_Hit.WALL)
	wall_hit.play()

func _on_bottom_wall_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.bounce(Ball.Side_Of_Ball_Hit.BOTTOM, Globals.Object_Hit.WALL)
	wall_hit.play()

func _on_left_wall_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.bounce(Ball.Side_Of_Ball_Hit.LEFT, Globals.Object_Hit.WALL)
	wall_hit.play()

func _on_right_wall_body_entered(body: Node2D) -> void:
	if body.name != "Ball": 
		return
	
	body.bounce(Ball.Side_Of_Ball_Hit.RIGHT, Globals.Object_Hit.WALL)
	wall_hit.play()
