extends KinematicBody2D
class_name Player

onready var HeroSprite : Sprite = $Texture

var velocity : Vector2

export(int) var speed = 110

func _physics_process(delta):
	
	horizontal_movement_env() # função de correr
	velocity = move_and_slide(velocity) # Mover e " Deslizar "
	HeroSprite.animacao(velocity) # Chamar as animações
	
func horizontal_movement_env():
	
	var inputs_direction : float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = inputs_direction * speed
	
	
