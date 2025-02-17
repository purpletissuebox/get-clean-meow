extends Interactable

@export var spawnID:int
@export var sceneID:GlobalData.RoomID

func _ready():
	self.obj_interaction = "Go to " + GlobalData.RoomID.keys()[self.sceneID].replace("_s_", "'s_").capitalize()

func _interact(_args:Array):
	GlobalContext.spawn_point_ID = self.spawnID
	GlobalContext.plot_progress[GlobalContext.level_ID] = GlobalContext.level_node.room_state
	GlobalContext.level_ID = self.sceneID
	SignalBus.change_lvl.emit(GlobalData.ROOM_PATHS[self.sceneID], 0.5)
