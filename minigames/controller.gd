extends Control

signal game_won

const ENTRY_TEXTS:Array[String] = [
	"LET'S GO <3"
]
const EXIT_TEXT:Array[String] = [
	"YOU DID IT!~"
]
const TEXT_ANGLE:float = 20.0
const TRANSITION_DURATION:float = 1.5

@onready var minigame_root: Control = $Game
@onready var transition_text: Label = $Label

var game_node:Minigame
var game_x:float

func _ready():
	self.game_x = minigame_root.position.x
	self.position.x = self.game_x

func set_up_game(filename:String):
	create_child(filename)
	slide_screen(1)
	spin_text()

func destroy_game():
	game_node.exit.disconnect(self.destroy_game)
	slide_screen(0)
	spin_text()
	

func create_child(filename:String):
	self.game_x = minigame_root.position.x
	minigame_root.size = self.size
	self.game_node = load(filename).instantiate()
	minigame_root.add_child(game_node)
	game_node.exit.connect(self.destroy_game)

func slide_screen(entry:int):
	var destination:Vector2 = Vector2.ZERO
	if entry:
		destination.x = -self.game_x
		transition_text.text = ENTRY_TEXTS.pick_random()
	else:
		destination.x = +self.game_x
		transition_text.text = EXIT_TEXT.pick_random()
	
	transition_text.pivot_offset = transition_text.size/2
	
	var t = create_tween()
	t.set_trans(Tween.TRANS_QUAD)
	t.set_ease(Tween.EASE_OUT_IN)
	self.position = -destination
	t.tween_property(self, "position", destination, TRANSITION_DURATION)
	await t.finished
	
	if entry:
		game_node.game_start = true
	else:
		game_won.emit()
		minigame_root.remove_child(game_node)
		game_node.queue_free()

func spin_text():
	self.transition_text.rotation = -deg_to_rad(TEXT_ANGLE)
	var t = create_tween()
	t.tween_property(transition_text, "rotation", deg_to_rad(TEXT_ANGLE), TRANSITION_DURATION)
