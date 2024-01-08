extends CharacterBody2D

class_name Ball

@export var ball_speed : float = 500.0

enum Side_Of_Ball_Hit {TOP, BOTTOM, LEFT, RIGHT}

func _ready() -> void:
	velocity = Vector2(randf_range(0, 0.25), randf()).normalized() * ball_speed

func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta)

func bounce(side_of_ball_hit : Side_Of_Ball_Hit):
	match side_of_ball_hit:
		Side_Of_Ball_Hit.TOP, Side_Of_Ball_Hit.BOTTOM:
			velocity.y *= -1
		Side_Of_Ball_Hit.LEFT, Side_Of_Ball_Hit.RIGHT:
			velocity.x *= -1
			
