extends CharacterBody2D

var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_left()
	pass # Replace with function body.

func move_left():
	velocity = Vector2.LEFT * speed
	pass
func move_right():
	velocity = Vector2.RIGHT * speed
	pass
func move_up():
	velocity = Vector2.UP * speed
	pass
func move_down():
	velocity = Vector2.DOWN * speed
	pass
func stop():
	velocity = Vector2.DOWN * 0
	move_right()
	pass
func checkPlugLocation():
	pass
func changeMovementX():
	var vectorTemp = $".".position
	if vectorTemp.x > 140:
		move_left()
		pass
	if vectorTemp.x < -140:
		move_right()
		pass
	pass

func moveToStart():
	var vectorTemp = $".".position
	vectorTemp.y = 50
	$".".position = vectorTemp
	move_right()
	print(vectorTemp.y)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_pressed("ui_select")):
		move_up()		
		pass
	changeMovementX()
	move_and_slide()
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("missedPlug"):
		$"../ScuffMark/ScuffMarkSprite".createScuffMark()
		moveToStart()
		#print("FAIL")
		pass
	if area.is_in_group("plugHole"):
		$"..".win()
		pass
	pass # Replace with function body.
