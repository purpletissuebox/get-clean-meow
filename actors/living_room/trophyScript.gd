extends Interactable

@export var text : Conversation

func _ready():
	remove()
	pass

#Need help with this, crashes game when you pass text
func _interact():
	#THE LINE BELOW THIS
	SignalBus.trigger_conversation.emit(self.text)
	GlobalContext.hasTrophy = true
	$".".visible = false
	remove()

func _on_button_pressed() -> void:
	SignalBus.trigger_conversation.emit(self.text)
	print("test")
	pass # Replace with function body.

func remove():
	if (GlobalContext.hasTrophy == true):
		self.queue_free()
		pass
	pass
