extends ParallaxBackground
class_name Background


export(Array , int) var layer_speed = [20,15,10,5]
export(bool) var can_process


func _ready():
	
	if can_process == false:
		set_physics_process(false) # parar o efeito
	else:
		set_physics_process(true) # continuar
		
		

func _physics_process(delta):
	
	for index in get_child_count():
		
		var child = get_child(index) # puxar as layers
		
		if child is ParallaxLayer:
			child.motion_offset.x -= layer_speed[index] * delta # Movimento das layers
			
