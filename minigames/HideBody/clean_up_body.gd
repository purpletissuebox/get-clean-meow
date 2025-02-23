extends Control

var holdingSaw = false
var holdingRag = false
var holdingArm = false
#maybe vars for each piece?
var tempVector2 = Vector2(0.0,0.0)

var isArmUpConnected = true
var isArmDownConnected = true
var isLegUpConnected = true
var isLegDownConnected = true
var isHeadConnected = true
var isBodyConnected = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func isConnected(bodyPart):
	if bodyPart == true:
		return true
	else:
		return false
func clearHolding():
	if holdingSaw == false:
		$saw.position = tempVector2
	pass
func cutting():
	print("Holding saw")
	print(holdingSaw)
	if holdingSaw == true:
		if isArmUpConnected == true:
			isArmUpConnected = false
	pass
func isHolding():
	if holdingSaw:
		#clearHolding()
		$saw.position = get_global_mouse_position()
		$SawButton.position = $saw.position
		pass
	elif holdingRag:
		pass
	elif holdingArm:
		#clearHolding()
		$armUp.position = get_global_mouse_position()
		$ArmUpButton.position = get_global_mouse_position()
		pass
	else:
		$Mouse.position = get_global_mouse_position()
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	isHolding()
	pass


func _on_saw_button_pressed() -> void:
	print(holdingSaw)
	holdingSaw = true
	holdingRag = false
	holdingArm = false
	pass # Replace with function body.


func _on_arm_up_button_pressed() -> void:
	if isArmUpConnected == false:
		holdingArm = true
		holdingSaw = false
		holdingRag = false
	else:
		holdingArm = false
	print("This is ")
	print(isArmUpConnected)
	cutting()
	pass # Replace with function body.


func _on_button_pressed() -> void:
	holdingArm = false
	holdingSaw = false
	holdingRag = false
	pass # Replace with function body.
