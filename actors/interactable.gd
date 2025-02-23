class_name Interactable extends Area2D

@export var obj_ID:String
@export var obj_interaction:String


var state:int:
	set(v):
		GlobalContext.level_node.room_state[self.obj_ID] = v
		state = v

#Need help with this, crashes game when you pass text
func _interact():
	#THE LINE BELOW THIS
	#SignalBus.trigger_conversation.emit(self.text.pick_random())
	SignalBus.updateTrophy.emit()
	$".".visible = false



func _on_button_pressed() -> void:
	SignalBus.trigger_conversation.emit(self.text.pick_random())
	print("test")
	pass # Replace with function body.
