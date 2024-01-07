extends ParallaxLayer

func _process(delta: float) -> void:
	motion_offset.x += Globals.scroll_speed * delta
