extends Camera

var decay = 0.8
var max_offset = Vector2(100,90)
var max_roll = 1

var trauma = 0.0
var trauma_power = 2


func _ready():
	randomize()
	
func _process(delta):
	
	if trauma:
		trauma = max(trauma - decay * delta,0)
		shake()
func shake():
	var amount = pow(trauma, trauma_power)
	
	h_offset = max_offset.x * amount * rand_range(-1,1)
	v_offset = max_offset.y * amount * rand_range(-1,1)
	
