extends Interactable

func _interact(_args:Array):
	var tableTalk = "I was spoken to!"
	SignalBus.newDialouge.emit(tableTalk)
	SignalBus.updateInventory.emit(2,1)
