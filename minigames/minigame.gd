class_name Minigame extends Control

signal exit
var game_won:bool = false

func complete_minigame():
	self.game_won = true
	self.exit.emit()
