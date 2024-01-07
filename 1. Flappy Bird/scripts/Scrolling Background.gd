extends ParallaxLayer

func _process(delta: float) -> void:
	motion_offset.x += Globals.SCROLL_SPEED * delta
