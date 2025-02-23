extends Node

var player_node:PlayerController
var level_ID:int
var level_node:Level
var spawn_point_ID:int = 0
var plot_progress:Array[Dictionary]
var goals:Dictionary
var day:int = 0
var hasTrophy:bool = false

func _ready():
	for i in GlobalData.RoomID.NUM_ROOMS:
		plot_progress.append({})
