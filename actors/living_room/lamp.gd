extends Interactable


@export var text:Array[Conversation]

func _interact():
	if GlobalContext.lampClean == false:
		GlobalContext.lampClean = true
		SignalBus.start_minigame.emit("res://minigames/plugInMinigame/plugInMinigame.tscn")
	else:
		SignalBus.trigger_conversation.emit(self.text.pick_random())
	pass
	
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
