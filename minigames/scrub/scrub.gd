extends Minigame

const NUM_DIRTS:int = 20
const BRUSH_RADIUS:int = 50

var dirt_particles:Array[TextureRect]
var old_pos:Vector2
var grime_left:float
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	self.old_pos = self.get_local_mouse_position()
	for i in NUM_DIRTS:
		var dirt = TextureRect.new()
		var txtr = PlaceholderTexture2D.new()
		txtr.size = Vector2(50,50)
		dirt.texture = txtr
		dirt.position = Vector2(randf_range(0,self.size.x), randf_range(0,self.size.y))
		self.add_child(dirt)
		self.dirt_particles.append(dirt)

func _process(delta:float):
	var new_pos = self.get_local_mouse_position()
	var speed = (new_pos-old_pos).length()/delta
	var score:float = 0
	sprite_2d.position = new_pos
	for dirt in self.dirt_particles:
		if Geometry2D.get_closest_point_to_segment(dirt.position, new_pos, old_pos).distance_to(dirt.position) < BRUSH_RADIUS:
			dirt.modulate.a = clampf(dirt.modulate.a - speed/20000, 0.0, 1.0)
		score += dirt.modulate.a
	self.old_pos = new_pos
	
	score /= NUM_DIRTS
	if score <= 0.02:
		self.exit.emit()
