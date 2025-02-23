extends Sprite2D

var textureS = preload("res://minigames/plugInMinigame/scuff mark.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func createScuffMark():
	var sprite = Sprite2D.new()
	var tempVector = Vector2(-165,-55)
	sprite.texture = textureS
	sprite.position = $"../../CharacterBody2D".position - tempVector
	add_child(sprite)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
