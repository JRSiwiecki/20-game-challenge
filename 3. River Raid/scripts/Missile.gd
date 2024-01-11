extends Area2D

class_name Missile

@export var speed : float = 1250.0

func _physics_process(delta: float) -> void:
	position -= transform.y * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.has_node("HealthComponent"):
		body.health_component.damage()
	
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()
