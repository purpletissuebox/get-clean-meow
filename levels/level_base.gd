class_name Level extends Node2D

const PLAYER_ACTOR:PackedScene = preload("res://actors/player/player.tscn")

@onready var spawns: Node2D = $Spawns
@onready var background: Sprite2D = $Background

var room_state:Dictionary

func _init():
	GlobalContext.level_node = self
	self.room_state = GlobalContext.plot_progress[GlobalContext.level_ID]

func _ready():
	var player_instance = PLAYER_ACTOR.instantiate()
	player_instance.position = spawns.get_child(GlobalContext.spawn_point_ID).position
	self.add_child(player_instance)
	
	boundPlayer(player_instance)

func boundPlayer(player_instance:PlayerController):
	var level_br_corner = background.get_rect().size
	
	player_instance.camera_2d.limit_top = 0
	player_instance.camera_2d.limit_left = 0
	player_instance.camera_2d.limit_right = level_br_corner.x
	player_instance.camera_2d.limit_bottom = level_br_corner.y

func get_actor_state(a:Interactable):
	if a.obj_ID in self.room_state:
		return self.room_state[a.obj_ID]
	else:
		return 0
