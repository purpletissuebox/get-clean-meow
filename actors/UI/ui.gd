extends Node2D

@export var spongeVar = 1
@export var bagVar  = 0
@export var broomVar  = 0
@export var keyVar  = 0
@export var isSpotOneUsed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	
