extends Interactable

const PREFIXES:Array[String] = ["Open ", "Close "]
const WIDTH:int = 79
const OPEN_TIME:float = 1.5

@export var convos:Array[Conversation]
@export var base_location:Vector2

func _ready():
	setup(self.state)
	
func setup(i:int):
	self.obj_interaction = PREFIXES[i] + "Van Door"
	self.position.x = self.base_location.x + i*WIDTH

func _interact():
	SignalBus.trigger_conversation.emit(self.convos[self.state])
	var response = await SignalBus.conversation_ended
	
	if response[0]:
		self.state ^= 1
		var t = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		t.tween_property(self, "position", Vector2(self.base_location.x + WIDTH*self.state, self.position.y), OPEN_TIME)
		await t.finished
		setup(self.state)
