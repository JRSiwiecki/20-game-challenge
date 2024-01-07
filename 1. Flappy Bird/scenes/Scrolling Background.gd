extends ParallaxLayer

@export var scroll_speed: float = -100.0

func _process(delta: float) -> void:
	motion_offset.x += scroll_speed * delta
