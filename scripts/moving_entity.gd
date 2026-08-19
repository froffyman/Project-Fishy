extends CharacterBody3D

const MOVE_SPEED = 20.0
const ROTATE_SPEED = PI
const MOUSE_SENSITIVITY = .01

func _input(e):
	if e is InputEventMouseMotion:
		rotate_object_local(Vector3.UP, -e.relative.x * MOUSE_SENSITIVITY) 	# yaw
		rotate_object_local(Vector3.RIGHT, -e.relative.y * MOUSE_SENSITIVITY) 	# pitch

func _process(dt):
	rotate_object_local(Vector3.FORWARD, Input.get_axis("roll_ccw", "roll_cw") * ROTATE_SPEED * dt) # roll
	
	var vel = Vector3(
		Input.get_axis("left", "right"), Input.get_axis("up", "down"), Input.get_axis("forward", "back")
	) * MOVE_SPEED
	global_position += global_basis * vel * dt
