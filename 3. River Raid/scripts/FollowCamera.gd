extends Camera2D

@export var jet : Jet

func _process(delta: float) -> void:
	position.y -= Globals.scroll_speed * delta
