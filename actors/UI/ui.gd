extends Node2D

@export var spongeVar = 0
@export var bagVar  = 0
@export var broomVar  = 0
@export var keyVar  = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spongeVar == 0:
		$Sponge.visible = false
		
	if broomVar == 0:
		$Broom.visible = false
		
	if bagVar == 0:
		$Bag.visible = false
		
	if keyVar == 0:
		$Key.visible = false
		
	if spongeVar == 1:
		$Sponge.visible = true
		
	if broomVar == 1:
		$Broom.visible = true
		
	if bagVar == 1:
		$Bag.visible = true
		
	if keyVar == 1:
		$Key.visible = true
	pass
