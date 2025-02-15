extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func dialouge(itemOfIntrest, text):
	#itemOfIntrest is the String name of an object, and will be compared -
	# - to the 2d sprites in this scene
	#For example. if the Girl is meant to say "hello i am cool" calling dialouge() would be
	# var tempString = "hello i am cool"
	# dialouge(CatGirl, tempString)
	pass

func emptyDialouge(text):
	#Similar to dialouge(itemOfIntrest,text) function, but doesnt require a itemOfIntrest
	#why does goDot not support function overloading lol
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
