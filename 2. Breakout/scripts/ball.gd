extends CharacterBody2D

class_name Ball

@export var ball_speed : float = 500.0

func _ready() -> void:
	velocity = Vector2(randf(), randf()).normalized() * ball_speed

func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta)
