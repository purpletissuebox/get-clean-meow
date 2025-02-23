extends Interactable

@export var text:Array[Conversation]

func _interact():
	if GlobalContext.mirrorClean == false:
		GlobalContext.mirrorClean = true
		SignalBus.start_minigame.emit("res://minigames/scrubMirror/game.tscn")
		$DirtyMirror.visible = false
	else:
		SignalBus.trigger_conversation.emit(self.text.pick_random())
	pass
	
func _ready() -> void:
	if GlobalContext.mirrorClean == true:
		$DirtyMirror.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
