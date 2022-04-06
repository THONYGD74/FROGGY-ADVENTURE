extends KinematicBody


const MAX_SPEED = 1000
const JUMP = 100
const Gravity = 50

var velocity = Vector3.ZERO

onready var camara = $cabeza/Camera
onready var cabeza = $cabeza

func get_input():
	var motion = Vector3()
	if Input.is_action_pressed("ui_up"):
		motion -= global_transform.basis.z
	if Input.is_action_pressed("ui_down"):
		motion += global_transform.basis.z
	if Input.is_action_pressed("ui_right"):
		motion += global_transform.basis.x
	if Input.is_action_pressed("ui_left"):
		motion -= global_transform.basis.x
	motion = motion.normalized()
	return motion
		
func _physics_process(delta):
	velocity.y = -20
	var desired_velocity = get_input() * MAX_SPEED * delta
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	shoot()
func _input(event):
	if event is InputEventMouseMotion:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		girar(event)
	
		
func girar(event):
	
	rotate_y(event.relative.x * -0.005)
	camara.rotate_x(event.relative.y * -0.005)
	camara.rotation.x = clamp(camara.rotation.x, -1.2, 1.2)
	
func shoot():
	if Input.is_action_pressed("ui_accept"):
		$"cabeza/Camera/Ak-47/AnimationPlayer".play("shoot")
		$cabeza/Camera.trauma = 0.06
