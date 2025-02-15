extends Node2D

@export var spongeVar = 0
@export var bagVar  = 0
@export var broomVar  = 1
@export var keyVar  = 1
@export var isSpotOneUsed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spongeVar == 0:
		$Sponge.visible = false
		isSpotOneUsed = true
		
	if broomVar == 0:
		$Broom.visible = false
		isSpotOneUsed = true

	if bagVar == 0:
		$Bag.visible = false
		isSpotOneUsed = true

	if keyVar == 0:
		$Key.visible = false
		isSpotOneUsed = true

	if isSpotOneUsed == false:
		if spongeVar == 1:
			$Sponge.visible = true
			
		if broomVar == 1:
			$Broom.visible = true
			
		if bagVar == 1:
			$Bag.visible = true
			
		if keyVar == 1:
			$Key.visible = true
	else:
		if spongeVar == 1:
			$Sponge.position = Vector2(240,240)
			$Sponge.visible = true
			
		if broomVar == 1:
			$Broom.position = Vector2(240,240)
			$Broom.visible = true
			
		if bagVar == 1:
			$Bag.position = Vector2(240,240)
			$Bag.visible = true
			
		if keyVar == 1:
			$Key.position = Vector2(240,240)
			$Key.visible = true
	pass
