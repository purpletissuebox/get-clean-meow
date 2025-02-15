extends CharacterBody2D

@export var speed = 400
@export var animation_tree : AnimationTree

var playback : AnimationNodeStateMachinePlayback

#Genuinly no idea what this does. Initalizes playback maybe?
func _ready():
	playback = animation_tree["parameters/playback"]


#Gets input
func get_input():
	var input_direction = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	velocity = input_direction * speed
	return input_direction

#Main Function
func _physics_process(delta):
	get_input()
	move_and_slide()
	select_animation()
	update_animation_parameters(get_input())


#Function that will check if moving, only idle animations right now
func select_animation():
	playback.travel("Idle")


#Function that updates animation, buddy who made the tutorial i followed LOVED new functions
func update_animation_parameters(input_direction):
	animation_tree["parameters/Idle/blend_position"] = input_direction
