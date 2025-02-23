extends Interactable

@export var locked_text:Conversation
@export var unlocked_text:Conversation
@export var checkListNotDone:Conversation
@onready var collision: StaticBody2D = $Collision

func _interact():
	if !GlobalContext.foundKey:
		SignalBus.trigger_conversation.emit(self.locked_text)
	elif checkIfDone() == false:
		SignalBus.trigger_conversation.emit(self.checkListNotDone)
	elif !self.state:
		SignalBus.trigger_conversation.emit(self.unlocked_text)
		var response = await SignalBus.conversation_ended
		if response[0]:
			self.state = 1
	if self.state:
		LoadZone.load_level(GlobalData.RoomID.BASEMENT, 0)

func checkIfDone():
	if GlobalContext.goals["Clean Bathtub"] == true:
		if GlobalContext.goals["Vaccuum Floors"] == true:
			if GlobalContext.goals["Exterminate Spider"] == true:
				return true
	return false
	pass
	
