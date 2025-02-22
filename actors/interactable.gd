class_name Interactable extends Area2D

@export var obj_ID:String
@export var obj_interaction:String
var state:int:
	set(v):
		GlobalContext.level_node.room_state[self.obj_ID] = v
		state = v

#func _enter_tree():
	#self.state = GlobalContext.level_node.get_actor_state(self)

func _interact():
	SignalBus.updateTrophy.emit()
	$".".visible = false
	pass


func _on_button_pressed() -> void:
	SignalBus.trigger_conversation.emit(self.text.pick_random())
	print("test")
	pass # Replace with function body.
