extends Interactable

@export var locked : Conversation
@export var unlocked:Conversation

@onready var graphic: Sprite2D = $Graphic

func _ready():
	self.graphic.hide()

func _interact():
	if GlobalContext.gtfo:
		SignalBus.trigger_conversation.emit(self.unlocked)
		await SignalBus.conversation_ended
		GlobalContext.player_node.busy = true
		self.graphic.show()
		
		SignalBus.change_lvl.emit("res://levels/END.tscn", 2)
	else:
		SignalBus.trigger_conversation.emit(self.locked)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
