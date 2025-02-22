extends Control

var holdingSaw = false
var holdingRag = false
var holdingArm = false
#maybe vars for each piece?


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func clearHolding():
	var tempVector2 = $saw.position
	$saw.position = tempVector2
	tempVector2 = $Mouse.position
	$Mouse.position = tempVector2
	pass

func isHolding():
	if holdingSaw:
		clearHolding()
		$saw.position = get_global_mouse_position()
		pass
	elif holdingRag:
		
		pass
	elif holdingArm:
		clearHolding()
		$ArmUpButton/armUp.position = get_global_mouse_position()
		pass
	else:
		$Mouse.position = get_global_mouse_position()
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	isHolding()
	pass


func _on_saw_button_pressed() -> void:
	holdingSaw = true
	holdingRag = false
	holdingArm = false
	pass # Replace with function body.


func _on_arm_up_button_pressed() -> void:
	holdingSaw = false
	holdingRag = false
	holdingArm = true
	pass # Replace with function body.
