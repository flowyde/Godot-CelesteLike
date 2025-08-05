extends CharacterBody2D

@export var max_speed: float = 20
@export var acceleration: float = 5

func get_input() -> int:
	return Input.get_axis("move_left","move_right")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += get_gravity().y
	var horizontal = get_input()
	#Calcula a aceleração
	velocity.x = lerp(velocity.x, horizontal * max_speed * 100, delta * acceleration)
	move_and_slide()
