extends CharacterBody2D


@export var speed = 300
@export var startingNum = 55.0
@export var movementDirection = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movementDirection = 0
	pass # Replace with function body.
func move_right():
	velocity = Vector2.RIGHT * speed
	pass
func move_left():
	velocity = Vector2.LEFT * speed
	pass
func move_up():
	velocity = Vector2.UP * speed
	pass
func move_down():
	velocity = Vector2.DOWN * speed
	pass
func shouldDirectionChange(delta: float):
	startingNum = startingNum - 1
	if (delta < 0):
		startingNum = 55
		movementDirection = getMovementDirection()
		pass
	pass
func isOutOfBounds():
	var vectorTemp = $".".position
	if vectorTemp.x > 140:
		movementDirection = 1
		pass
	if vectorTemp.x < -140:
		movementDirection = 0
		pass
	if vectorTemp.y > 120:
		movementDirection = 2
		pass
	if vectorTemp.y < -100:
		movementDirection = 3
		pass
	pass

func getMovementDirection():
	var rng = RandomNumberGenerator.new()
	var temp = rng.randi_range(0, 3)
	return temp
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$Button.visible = false
	shouldDirectionChange(startingNum)
	isOutOfBounds()
	match movementDirection:
		0:
			move_right()
		1:	
			move_left()
		2:
			move_up()
		3:
			move_down()
	move_and_slide()
	pass
