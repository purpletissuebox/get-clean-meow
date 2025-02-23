extends Interactable

@export var key:Interactable
@export var discovery:Conversation
@export var text:Array[Conversation]

func _interact():
	if GlobalContext.rugClean == false:
		GlobalContext.rugClean = true
		SignalBus.start_minigame.emit("res://minigames/scrubRug/game.tscn")
		await SignalBus.minigame_ended
		$cleanRug.visible = false
		$"../../rolledRug".visible = true
		key.appear()
		SignalBus.trigger_conversation.emit(self.discovery)
	else:
		SignalBus.trigger_conversation.emit(self.text.pick_random())
	pass
	
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalContext.rugClean == true:
		$cleanRug.visible = false
		$"../../rolledRug".visible = true
	pass
