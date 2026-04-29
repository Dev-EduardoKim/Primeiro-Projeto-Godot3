extends KinematicBody2D
class_name Player

var vector2 : Vector2 # Pegar e modificar a posição do elemento.

# Valores 
export(int) var speed = 110


# Main
func _physics_process(delta) :
	horizontal_movement_env()
	vector2 = move_and_slide(vector2)
	
# Movimento Horizontal
func horizontal_movement_env():
	pass

