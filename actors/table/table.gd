extends Interactable

func _interact(_args:Array):
	var tableTalk = "I was spoken to!"
	$"../Dialouge".dialouge(tableTalk)
	$"../Ui".bagVar = 1
