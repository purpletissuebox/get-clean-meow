extends Interactable

@export var d:Conversation

func _ready():
	if self.state:
		die()
	self.state = 1
	SignalBus.trigger_conversation.emit(self.d)
	GlobalContext.gtfo = true
	
func die():
	self.get_parent().remove_child(self)
	self.queue_free()
