extends CharacterBody2D

@export var speed = 400
@export var animation_tree : AnimationTree

var playback : AnimationNodeStateMachinePlayback

func _ready():
	playback = animation_tree["parameters/playback"]

func get_input():
	var input_direction = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	velocity = input_direction * speed
	return input_direction
func _physics_process(delta):
	get_input()
	move_and_slide()
	select_animation()
	update_animation_parameters(get_input())

func select_animation():
	playback.travel("Idle")

func update_animation_parameters(input_direction):
	animation_tree["parameters/Idle/blend_position"] = input_direction
