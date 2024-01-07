extends Camera2D

@export var CAMERA_SPEED: float = 100

func _process(delta: float) -> void:
	position.x += CAMERA_SPEED * delta
