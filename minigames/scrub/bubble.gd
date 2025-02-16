extends Sprite2D

const BUBBLE_GFX:Array[Texture2D] = [
	preload("res://minigames/scrub/bubble1.png")
]
const BUBBLE_SFX:Array[String] = [
	"res://minigames/scrub/spawn1.wav",
	"res://minigames/scrub/spawn2.wav",
	"res://minigames/scrub/spawn3.wav",
	"res://minigames/scrub/spawn4.wav",
	"res://minigames/scrub/spawn5.wav",
]

var lifetime:float

func _ready():
	self.texture = BUBBLE_GFX.pick_random()
	self.lifetime = randf_range(0.4,0.8)
	SoundDriver.play_sfx(BUBBLE_SFX.pick_random(), 1.0)

func _process(delta:float):
	self.lifetime -= delta
	if self.lifetime < 0:
		self.get_parent().remove_child(self)
		self.queue_free()
