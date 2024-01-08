extends CharacterBody2D

class_name Ball

signal score_updated

@export var ball_speed : float = 500.0
@export var ball_speed_increase : float = 25.0
@export var max_ball_speed : float = 850.0

enum Side_Of_Ball_Hit {TOP, BOTTOM, LEFT, RIGHT}

func _ready() -> void:
	velocity = Vector2(randf_range(0, 0.25), randf()).normalized() * ball_speed

func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta)

func bounce(side_of_ball_hit : Side_Of_Ball_Hit, object_hit : Globals.Object_Hit) -> void:
	match side_of_ball_hit:
		Side_Of_Ball_Hit.TOP, Side_Of_Ball_Hit.BOTTOM:
			velocity.y *= -1
		Side_Of_Ball_Hit.LEFT, Side_Of_Ball_Hit.RIGHT:
			velocity.x *= -1
	
	if object_hit == Globals.Object_Hit.BRICK:
		increase_ball_speed()
		Globals.increment_score()
		score_updated.emit()

func increase_ball_speed() -> void:
	
	if ball_speed >= max_ball_speed:
		return
	
	ball_speed += ball_speed_increase
	velocity += Vector2(-ball_speed_increase if velocity.x <= 0.0 else ball_speed_increase, 
	-ball_speed_increase if velocity.y <= 0.0 else ball_speed_increase)
