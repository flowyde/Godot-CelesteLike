extends CharacterBody2D

@export var max_speed: float = 20
@export var acceleration: float = 5


@export var jump_height:	float = 0
@export var jump_time_peak:	float = 0
@export var jump_time_fall:	float = 0

@onready var jump_velocity:	float = ((2 * jump_height)/(jump_time_peak)) * -1
@onready var jump_gravity:	float = ((2 * jump_height)/(jump_time_peak**2)) * -1
@onready var fall_gravity:	float = ((2 * jump_height)/(jump_time_fall**2)) * -1

func get_input() -> int:
	return Input.get_axis("move_left","move_right")

func get_jump():
	var jump = Input.is_action_pressed("move_jump")
	if jump and is_on_floor():
		velocity.y = jump_velocity

func get_fall() -> float:
	return jump_gravity if velocity.y < 0 else fall_gravity

func _physics_process(delta: float) -> void:
	velocity.y += get_fall() * delta
	var horizontal = get_input()
	#Calcula a aceleração
	velocity.x = lerp(velocity.x, horizontal * max_speed * 100, delta * acceleration)
	get_jump()
	move_and_slide()
