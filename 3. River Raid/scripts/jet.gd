extends CharacterBody2D

class_name Jet

@export var animation : AnimatedSprite2D
@export var left_particle_emitter : GPUParticles2D
@export var right_particle_emitter : GPUParticles2D
@export var engine_particle_emitter : GPUParticles2D

var speed : float = Globals.scroll_speed

func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, -speed)
	
	check_forward_input()
	check_side_input()
	
	move_and_slide()

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
		velocity.y += speed
	
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
