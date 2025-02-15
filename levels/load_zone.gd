extends Interactable

@export var spawnID:int
@export var sceneID:GlobalData.RoomID

func _ready():
	self.obj_name = "Go to " + GlobalData.RoomID.keys()[self.sceneID].replace("_s_", "'s_").capitalize()

func _interact(_args:Array):
	GlobalContext.spawn_point_ID = self.spawnID
	SignalBus.change_lvl.emit(GlobalData.ROOM_PATHS[self.sceneID], 0.5)
