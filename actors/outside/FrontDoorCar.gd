extends Interactable

@export var text : Conversation
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func breakWindow():
	if 	GlobalContext.hasTrophy == true:
		pass
	else:
		pass
	
func _interact():
	print(self.text)
	SignalBus.trigger_conversation.emit(self.text)
	#breakWindow()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
