class_name Doodad extends Interactable

@export var text:Array[Conversation]

func _interact():
	SignalBus.trigger_conversation.emit(self.text.pick_random())
