extends HBoxContainer

@export var player:PlayerController
@onready var label: Label = $Text

func redraw():
	if player.nearby_interactables.size() == 0:
		self.hide()
		return
	elif self.hidden:
		self.show()
	
	var thing:Interactable = player.nearby_interactables[-1]
	label.text = "Interact with " + thing.obj_name
	
	var midpoint = (self.get_minimum_size().x*self.scale.x)/2
	self.position.x = -midpoint
