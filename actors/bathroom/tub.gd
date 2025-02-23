extends Interactable


@export var text:Array[Conversation]

func _interact():
	if GlobalContext.tubClean == false:
		GlobalContext.tubClean = true
		SignalBus.start_minigame.emit("res://minigames/scrub/game.tscn")
		$DirtyTub.visible = false
		GlobalContext.goals["Clean Bathtub"] = true
	else:
		SignalBus.trigger_conversation.emit(self.text.pick_random())
	pass
	
func _ready() -> void:
	if GlobalContext.tubClean == true:
		$DirtyTub.visible = false
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
