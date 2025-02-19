extends Interactable

func _interact(_args:Array):
	if self.state == 0:
		SignalBus.start_minigame.emit("res://minigames/scrub/game.tscn")
		await SignalBus.minigame_ended
		self.state = 1
	
	#var tableTalk = "I was spoken to!"
	#$"../CanvasLayer/Dialouge".dialouge(tableTalk)
	#$"../CanvasLayer/Ui".bagVar = 1

