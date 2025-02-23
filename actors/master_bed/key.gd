extends Interactable

@export var pickup_txt:Conversation

func _ready():
	if self.state == 2:
		die()
	elif self.state == 0:
		self.disappear()

func appear():
	self.show()
	self.monitorable = true
	self.state = 1

func disappear():
	self.hide()
	self.monitorable = false

func _interact():
	SignalBus.trigger_conversation.emit(self.pickup_txt)
	await SignalBus.conversation_ended
	self.state = 1
	GlobalContext.foundKey = true
	die()

func die():
	self.get_parent().remove_child(self)
	self.queue_free()
