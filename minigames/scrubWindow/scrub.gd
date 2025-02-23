extends Minigame

const NUM_DIRTS:int = 20
const BRUSH_RADIUS:int = 50
const DMG_RATE:float = 20000.0
const BUBBLE_THRESHOLD:float = 30.0
const BUBBLE_SCENE:PackedScene = preload("res://minigames/scrubMirror/bubble.tscn")

var dirt_particles:Array[TextureRect]
var old_pos:Vector2
var bubble_timer:float
@onready var hand_sprite: Sprite2D = $arm

func _ready():
	self.old_pos = hand_sprite.position
	for i in NUM_DIRTS:
		var dirt = TextureRect.new()
		var txtr = load("res://minigames/scrubMirror/dirt.png")
		#txtr.size = Vector2(50,50)
		dirt.texture = txtr
		dirt.position = Vector2(randf_range(0,self.size.x), randf_range(0,self.size.y))
		self.add_child(dirt)
		self.dirt_particles.append(dirt)

func _process(delta:float):
	if !game_start:
		return
	if !game_won:
		if remove_dirt(delta):
			bubble_timer -= delta
			if bubble_timer < 0:
				bubble_timer = randf_range(0.05,0.2)
				var bubble_instance = BUBBLE_SCENE.instantiate()
				bubble_instance.position = self.old_pos + Vector2(randi_range(-100,100), randi_range(-100,100))
				self.add_child(bubble_instance)
				
	self.hand_sprite.position = self.old_pos

func remove_dirt(delta:float):
	var new_pos = self.get_local_mouse_position()
	var speed = (new_pos-old_pos).length()/delta
	var score:float = 0
	for dirt in self.dirt_particles:
		if Geometry2D.get_closest_point_to_segment(dirt.position, new_pos, old_pos).distance_to(dirt.position) < BRUSH_RADIUS:
			dirt.modulate.a = clampf(dirt.modulate.a - speed/DMG_RATE, 0.0, 1.0)
		score += dirt.modulate.a
	self.old_pos = new_pos
	
	score /= NUM_DIRTS
	if score <= 0.02:
		complete_minigame()
	
	return speed > BUBBLE_THRESHOLD
