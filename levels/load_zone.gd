class_name LoadZone extends Interactable

@export var spawnID:int
@export var sceneID:GlobalData.RoomID

func _ready():
	self.obj_interaction = "Go to " + GlobalData.RoomID.keys()[self.sceneID].replace("_s_", "'s_").capitalize()

func _interact(_args:Array):
	load_level(self.sceneID, self.spawnID)
	
static func load_level(level:GlobalData.RoomID, spawn:int):
	GlobalContext.spawn_point_ID = spawn
	GlobalContext.plot_progress[GlobalContext.level_ID] = GlobalContext.level_node.room_state
	GlobalContext.level_ID = level
	SignalBus.change_lvl.emit(GlobalData.ROOM_PATHS[level], 0.5)
