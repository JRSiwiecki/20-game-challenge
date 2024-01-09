extends Node

const INITIAL_SCROLL_SPEED : float = 400.0
const MAX_SCROLL_SPEED : float = 500.0

var scroll_speed : float = 400.0

func increase_scroll_speed() -> void:
	scroll_speed = MAX_SCROLL_SPEED

func reset_scroll_speed() -> void:
	scroll_speed = INITIAL_SCROLL_SPEED
