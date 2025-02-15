extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	if Input.is_action_pressed("walk_left"):
	
	if Input.is_action_pressed("walk_right"):
	
	if Input.is_action_pressed("walk_up"):
	
	if Input.is_action_pressed("walk_down"):
	

	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
