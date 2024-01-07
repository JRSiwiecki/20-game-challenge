extends Camera2D

@export var camera_speed: float = 100

func _process(delta: float) -> void:
	position.x += camera_speed * delta
