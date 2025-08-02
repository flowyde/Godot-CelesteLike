extends CharacterBody2D

const max_speed = 200
const acceleration = 8000

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
	
func get_input():
	var hMove = Input.get_axis("move_left","move_right")
	if hMove != 0:
		velocity.x += hMove * acceleration
		velocity.x = clamp(velocity.x, -max_speed, max_speed)
	else:
		velocity.x = 0
		
	velocity.y += get_gravity().y
	
	print(velocity.x)

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	pass
