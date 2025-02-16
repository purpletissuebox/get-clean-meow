extends Interactable

func _interact(_args:Array):
	var tableTalk = "I was spoken to!"
	$"../CanvasLayer/Dialouge".dialouge(tableTalk)
	$"../CanvasLayer/Ui".bagVar = 1
