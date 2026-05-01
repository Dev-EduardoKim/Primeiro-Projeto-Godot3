extends Sprite
class_name PlayerSprite


export(NodePath) onready var anima = get_node(anima) as AnimationPlayer

func animacao(direction : Vector2):
	to_turn(direction)
	horizontal_env(direction)
	
	
func to_turn(direction : Vector2):
	
	if direction.x > 0 :
		flip_h = false
	elif direction.x < 0 :
		flip_h = true
func horizontal_env(direction : Vector2) :
	
	if direction.x != 0:
		anima.play("run")
	else:
		anima.play("idle")
