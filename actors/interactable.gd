class_name Interactable extends Area2D

@export var obj_ID:String
@export var obj_interaction:String
var state:int
static var num_interactables:int

func _init():
	if !self.obj_ID:
		self.obj_ID = "actor_#" + str(num_interactables)
		num_interactables += 1
	self.state = GlobalContext.level_node.get_actor_state(self)

func _interact(_args:Array):
	pass
