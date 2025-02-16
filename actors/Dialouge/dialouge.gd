extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hideText()
	pass # Replace with function body.




func showText():
	$dialougeOutline.visible = true
	$Text.visible = true
	$Button.visible = true
	pass
func hideText():
	$dialougeOutline.visible = false
	$Text.visible = false
	$Button.visible = false
	pass

func dialouge(text):
	#why does goDot not support function overloading lol
	#Pass text here.
	#Will make visible no matter what. Must be made invisible again after
	showText()
	$Text.text = str(text)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	hideText()
	pass # Replace with function body.
