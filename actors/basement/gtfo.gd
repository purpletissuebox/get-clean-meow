extends Interactable

@export var d:Conversation

func _process(_delta:float):
	if self.state:
		die()
	self.state = 1
	SignalBus.trigger_conversation.emit(self.d)
	SoundDriver.play_bgm(2,0.5,1)
	GlobalContext.gtfo = true
	
func die():
	self.get_parent().remove_child(self)
	self.queue_free()
