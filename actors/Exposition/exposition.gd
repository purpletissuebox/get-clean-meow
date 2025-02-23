extends Control

const GOAL_LIST:Array[String] = [
	"Clean Bathtub",
	"Vaccuum Floors",
	"Exterminate Spider",
]

@export var introText: Conversation
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	addGoals()
	SignalBus.trigger_conversation.emit(introText)
	await SignalBus.conversation_ended
	SignalBus.change_lvl.emit("res://levels/outside/level.tscn",1)
	pass # Replace with function body.

func addGoals():
	for g in GOAL_LIST:
		GlobalContext.goals[g] = false
