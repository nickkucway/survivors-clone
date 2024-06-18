extends CharacterBody3D
var movement_speed = 0.5

func _physics_process(_delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector3(x_mov, 0, y_mov)		 
	velocity = mov.normalized()*movement_speed
	move_and_slide()
