extends Node2D


func _on_top_wall_body_entered(body: Node2D) -> void:
	body.velocity.y *= -1

func _on_bottom_wall_body_entered(body: Node2D) -> void:
	body.velocity.y *= -1

func _on_left_wall_body_entered(body: Node2D) -> void:
	body.velocity.x *= -1

func _on_right_wall_body_entered(body: Node2D) -> void:
	body.velocity.x *= -1
