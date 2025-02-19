extends Node2D

@export var spongeVar = 1
@export var bagVar  = 0
@export var broomVar  = 0
@export var keyVar  = 0
@export var isSpotOneUsed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.updateInventory.connect(changeItem)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func changeItem(item, changeValue):
	#item list
	#1 = sponge
	#2 = bag
	#3 = broom
	#4 = key
	
	#change value list
	#0 = remove
	#1 = add
	match(item):
		1:
			if(changeValue == 1):
				spongeVar = 1
			else:
				spongeVar = 0
		2:
			if(changeValue == 1):
				bagVar = 1
			else:
				bagVar = 0
		3:
			if(changeValue == 1):
				broomVar = 1
			else:
				broomVar = 0
		4:
			if(changeValue == 1):
				keyVar = 1
			else:
				keyVar = 0
	updateInventory()
	pass

func updateInventory():
	#iterats through the inventory list, gives first item found to first slot
	#Then goes to second, etc
	#Would be much better to iterate through an array, but I didnt want to type it
	isSpotOneUsed = false
	if spongeVar == 1:
			if isSpotOneUsed == true:
				$Sponge.visible = true
				$Sponge.position = Vector2(240,240)
			if isSpotOneUsed == false:
				$Sponge.visible = true
				isSpotOneUsed = true
			pass
	if broomVar == 1:
			if isSpotOneUsed == true:		
				$Broom.visible = true
				$Broom.position = Vector2(240,240)
			if isSpotOneUsed == false:
				$Broom.visible = true
				isSpotOneUsed = true
			pass
	if bagVar == 1:
			if isSpotOneUsed == true:	
				$Bag.visible = true
				$Bag.position = Vector2(240,240)
			if isSpotOneUsed == false:
				$Bag.visible = true
				isSpotOneUsed = true
			pass
	if keyVar == 1:
			if isSpotOneUsed == true:
				$Key.visible = true
				$Key.position = Vector2(240,240)
			if isSpotOneUsed == false:
				$Key.visible = true
				isSpotOneUsed = true
			pass
	if spongeVar == 0:
			$Sponge.visible = false
	if bagVar == 0:
			$Bag.visible = false
	if broomVar == 0:
			$Broom.visible = false
	if keyVar == 0:
			$Key.visible = false
	pass
	
