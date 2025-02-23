extends Control

var holdingSaw = false
var holdingRag = false
var holdingArmUp = false
var holdingArmDown = false
var holdingLegUp = false
var holdingLegDown = false
var holdingHead = false
var holdingBody = false
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
	elif holdingArmUp:
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

func allButOne(one):
	print("THIS IS ONE")
	print(one)
	# 0 = armUp
	# 1 = armDown
	# 2 = legUp
	# 3 = legDown
	# 4 = head
	# 5 = body
	# 6 = saw
	
	match one:
		0:
			holdingArmUp = true
			holdingSaw = false
			holdingArmDown = false
			holdingLegUp = false
			holdingLegDown = false
			holdingHead = false
			holdingBody = false
		1:
			holdingArmDown = true
			holdingSaw = false
			holdingArmUp = false
			holdingLegUp = false
			holdingLegDown = false
			holdingHead = false
			holdingBody = false
		2:
			holdingLegUp  = true
			holdingSaw = false
			holdingArmUp = false
			holdingArmDown = false
			holdingLegDown = false
			holdingHead = false
			holdingBody = false
		3:
			holdingLegDown  = true
			holdingSaw = false
			holdingArmUp = false
			holdingArmDown = false
			holdingLegUp = false
			holdingHead = false
			holdingBody = false
		4:
			holdingHead  = true
			holdingSaw = false
			holdingArmUp = false
			holdingArmDown = false
			holdingLegUp = false
			holdingLegDown = false
			holdingBody = false
		5:
			holdingBody  = true
			holdingSaw = false
			holdingArmUp = false
			holdingArmDown = false
			holdingLegUp = false
			holdingLegDown = false
			holdingHead = false
		6:
			holdingSaw  = true
			holdingArmUp = false
			holdingArmDown = false
			holdingLegUp = false
			holdingLegDown = false
			holdingHead = false
			holdingBody = false
		7:
			pass
		8:
			pass
		9:
			pass
				
func _on_saw_button_pressed() -> void:
	allButOne(holdingSaw)
	pass # Replace with function body.


func _on_arm_up_button_pressed() -> void:
	if isArmUpConnected == false:
		allButOne(0)
	else:
		holdingArmUp = false
	print("This is ")
	print(isArmUpConnected)
	cutting()
	pass # Replace with function body.


func _on_button_pressed() -> void:
	holdingRag = false
	holdingSaw = false
	holdingRag = false
	holdingArmUp = false
	holdingArmDown = false
	holdingLegUp = false
	holdingLegDown = false
	holdingHead = false
	holdingBody = false
	pass # Replace with function body.
