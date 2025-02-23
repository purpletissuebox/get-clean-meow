extends Control

@export var introText: Conversation
# Called when the node enters the scene tree for the first time.
const GOAL_LIST:Array[String] = [
	"Clean Bathtub",
	"Vaccuum Floors",
	"Exterminate Spider",
]
func _ready() -> void:
	addGoals()
	SignalBus.trigger_conversation.emit(introText)
	await SignalBus.conversation_ended
	GlobalContext.level_ID = GlobalData.RoomID.OUTSIDE
	SignalBus.change_lvl.emit("res://levels/outside/level.tscn",1)
	
	pass # Replace with function body.

func addGoals():
	for g in GOAL_LIST:
		GlobalContext.goals[g] = false
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
