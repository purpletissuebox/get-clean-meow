extends Control

const SWEEP_FORCE:float = 30 #ft-lbf
const BROOM_MASS:float = 10 #lbm
const BROOM_RADIUS:float = 4.5 #ft
const GRAVITY:float = 32 #ft/s/s

@onready var texture_rect: TextureRect = $TextureRect

var angvel:float = 0
var angaccel:float = 0

func _process(delta:float):
	var torque:float = Input.get_axis("walk_right", "walk_left") * SWEEP_FORCE
	var weight:float = BROOM_MASS*GRAVITY*sin(texture_rect.rotation)/2
	
	texture_rect.rotation += self.angvel*delta
	self.angvel += self.angaccel*delta
	self.angaccel = 3*(torque - weight)/(BROOM_MASS*BROOM_RADIUS*BROOM_RADIUS)
