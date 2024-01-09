extends CharacterBody2D

class_name Jet

@export var missile_scene : PackedScene

@export var animation : AnimatedSprite2D
@export var left_particle_emitter : GPUParticles2D
@export var right_particle_emitter : GPUParticles2D
@export var engine_particle_emitter : GPUParticles2D
@export var health_component : HealthComponent

var speed : float

func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, -speed)
	
	speed = Globals.scroll_speed
	
	check_attack_input()
	check_forward_input()
	check_side_input()
	
	move_and_slide()

func check_attack_input() -> void:
	if Input.is_action_just_pressed("shoot"):
		var missile : Missile = missile_scene.instantiate()
		owner.add_child(missile)
		missile.position = global_position + Vector2(0.0, -100.0)

func check_forward_input() -> void:
	if Input.is_action_pressed("forward"):
		Globals.increase_scroll_speed()
		turn_on_particle_emitters()
		velocity.y -= speed
	
	if Input.is_action_just_released("forward"):
		Globals.reset_scroll_speed()
		turn_off_particle_emitters()
	
	if Input.is_action_pressed("brake"):
		Globals.decrease_scroll_speed()
		velocity.y += Globals.MAX_SCROLL_SPEED - Globals.MIN_SCROLL_SPEED
	
	if Input.is_action_just_released("brake"):
		Globals.reset_scroll_speed()

func check_side_input() -> void:
	if Input.is_action_pressed("left"):
		velocity.x += -speed
		animation.play("lean_left")
	
	elif Input.is_action_pressed("right"):
		velocity.x += speed
		animation.play("lean_right")
	
	else:
		animation.play("default")

func turn_on_particle_emitters() -> void:
	left_particle_emitter.emitting = true
	right_particle_emitter.emitting = true
	engine_particle_emitter.emitting = true

func turn_off_particle_emitters() -> void:
	left_particle_emitter.emitting = false
	right_particle_emitter.emitting = false
	engine_particle_emitter.emitting = false

# Kill player if they collide with anything other than fuel.
func _on_hitbox_component_body_entered(body: Node2D) -> void:
	if body.name == "Jet" or body.name == "Missile":
		return
	
	health_component.damage()
