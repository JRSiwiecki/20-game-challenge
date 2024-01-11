extends Node2D

@export var destructables_group : Node2D
@export var enemies_group : Node2D
@export var jet : Jet

var high_score : int = 0
var score : int = 0

func _ready() -> void:
	# Connect signals for destructables
	for destructable in destructables_group.get_children():
		if destructable is Bridge:
			destructable.bridge_destroyed.connect(_on_bridge_bridge_destroyed)
		else:
			destructable.fuel_destroyed.connect(_on_fuel_fuel_destroyed)
		
	# Connect signals for enemies
	for enemy in enemies_group.get_children():
		enemy.enemy_destroyed.connect(_on_enemy_enemy_destroyed)

func _on_bridge_bridge_destroyed() -> void:
	score += 50
	print("score: ", score)

func _on_fuel_fuel_destroyed() -> void:
	score += 20
	print("score: ", score)

func _on_enemy_enemy_destroyed() -> void:
	score += 10
	print("score: ", score)
