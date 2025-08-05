extends CharacterBody2D

#variaveis para o movimento horizontal (esquerda e direita)
@export var max_speed: float = 20
@export var acceleration: float = 5

#variaveis para o movimento vertical (Pulo e queda)
@export var jump_height: float = 100
@export var jump_time_peak: float = 0.5
@export var jump_time_fall: float = 0.4

@onready var jump_velocity: float = ((2 * jump_height)/(jump_time_peak)) * -1.0
@onready var jump_gravity: float = ((2 * jump_height)/(jump_time_peak**2)) * -1.0
@onready var fall_gravity: float = ((2 * jump_height)/(jump_time_fall**2)) * -1.0 

func get_horizontal_input() -> int:
	#retorna um valor de 1, 0 ou -1 
	return Input.get_axis("move_left","move_right")

func get_jump():
	#Define a velocity.y como a jump_velocity de acordo com o Input do jogador
	var jump = Input.is_action_pressed("move_jump")
	if jump and is_on_floor():
		velocity.y = jump_velocity

func get_fall() -> float:
	#retorna o valor da gravidade do pulo se estiver no chão, se não, retorna o valor da queda
	return jump_gravity if velocity.y < 0 else fall_gravity

func _physics_process(delta: float) -> void:
	#Habilita a habilidade de pulo
	if not is_on_floor():
		velocity.y -= get_fall() * delta
	get_jump()
	
	#Calcula a aceleração horizontal
	var horizontal = get_horizontal_input()
	velocity.x = lerp(velocity.x, horizontal * max_speed * 10, delta * acceleration)
	
	move_and_slide()
