extends Node

var player_node:PlayerController
var level_ID:int
var level_node:Level
var spawn_point_ID:int = 0
var plot_progress:Array[Dictionary]
var tubClean
var mirrorClean
var bedClean
var lampClean
var windowClean
var lampInBed
var tilesClean
var rugClean
var foundKey:bool
var goals:Dictionary
var day:int = 0
var hasTrophy:bool = false
var gtfo:bool = false

func _ready():
	for i in GlobalData.RoomID.NUM_ROOMS:
		plot_progress.append({})
	tubClean = false
	mirrorClean = false
	bedClean = false
	lampClean = false
	windowClean = false
	lampInBed = false
	tilesClean = false
	rugClean = false
	foundKey = false
