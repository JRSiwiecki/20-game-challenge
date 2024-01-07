extends Node

const SCROLL_SPEED: float = -300.0

# Need this or we will have 2 score when passing through first pipe
# and forever be ahead by 1 score.
var score: int = -1

var high_score: int
