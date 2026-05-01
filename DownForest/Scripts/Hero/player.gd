extends KinematicBody2D
class_name Player

onready var HeroSprite : Sprite = $Texture

var velocity : Vector2

export(int) var speed = 110

var jump_count : int = 0 # Contador de pulos
var landing : bool = false # pouso
export(int) var jump_speed = -175 # Força do Pulo 
export(int) var player_gravity = 350 # Gravidade do player

func _physics_process(delta):
	
	horizontal_movement_env() # função de correr
	vertical_movement_env() # Função de pulo
	velocity = move_and_slide(velocity,Vector2.UP) # Mover e " Deslizar "
	HeroSprite.animacao(velocity) # Chamar as animações
	gravity(delta) # Fisica = Gravidade do Player
	
func horizontal_movement_env() -> void:
	
	var inputs_direction : float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = inputs_direction * speed
	

func vertical_movement_env() -> void:
	if is_on_floor() :
		jump_count = 0
	if Input.is_action_just_pressed("move_up") and jump_count < 2:
		jump_count += 1 
		velocity.y = jump_speed
	

# Fisica

func gravity(delta : float) -> void:
	
	velocity.y += player_gravity * delta
	
	if velocity.y >= player_gravity:
		velocity.y = player_gravity # Limitar o valor do pulo
		
		# A limitação serve para que o personagem não saia da tela 
