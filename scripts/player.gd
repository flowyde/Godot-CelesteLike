extends CharacterBody2D

var speed : int = 20

func _ready() -> void:
	
	pass
	
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var hMove: int = Input.get_axis("move_right","move_left")
	velocity.x += hMove * speed
	velocity.y += get_gravity().y
	move_and_slide()
	pass
