extends Control

@export var introText: Conversation
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.trigger_conversation.emit(introText)
	await SignalBus.conversation_ended
	SignalBus.change_lvl.emit("res://levels/outside/level.tscn",1)
	pass # Replace with function body.
