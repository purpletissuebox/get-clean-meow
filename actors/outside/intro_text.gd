extends Interactable

@export var txt:Conversation

func _process(_delta):
	if !state:
		self.state = 1
		SignalBus.trigger_conversation.emit(self.txt)
		await SignalBus.conversation_ended
		self.state = 2
	elif state == 2:
		byebye()

func byebye():
		self.get_parent().remove_child(self)
		self.queue_free()
