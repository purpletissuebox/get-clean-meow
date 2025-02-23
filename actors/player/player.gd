class_name PlayerController extends CharacterBody2D

const BASE_DIR:Vector2 = Vector2(1,0.75)
const BASE_SPEED:float = 80

@onready var camera_2d: Camera2D = $Camera2D
@onready var interact_label: HBoxContainer = $InteractLabel
@export var animation_tree : AnimationTree



var busy:bool
var nearby_interactables:Array[Interactable]
var playback : AnimationNodeStateMachinePlayback

func _init():
	GlobalContext.player_node = self

#Genuinly no idea what this does. Initalizes playback maybe?
func _ready():
	SignalBus.trigger_conversation.connect(func(_x):self.busy = true)
	SignalBus.conversation_ended.connect(func(_x):self.busy = false)
	playback = animation_tree["parameters/playback"]
	
func _physics_process(_delta:float):
	if busy:
		return
	
	if Input.is_action_just_pressed("interact"):
		if self.nearby_interactables.size() != 0:
			self.nearby_interactables[-1]._interact()
	
	
	#quick solution I found online REDDIT oh yeah yeah, stops player if trying to move diagonal
	var dir = Input.get_vector("walk_left","walk_right","walk_up","walk_down")
	#if dir.x != 0 and dir.y != 0:
	#	dir.y = 0
	
	self.velocity = dir*BASE_SPEED*BASE_DIR
	if self.can_process():
		move_and_slide()
	select_animation()
	update_animation_parameters(Input.get_vector("walk_left","walk_right","walk_up","walk_down"))

func approached_object(thing:Interactable):
	self.nearby_interactables.append(thing)
	interact_label.redraw()

func left_object(thing:Interactable):
	self.nearby_interactables.erase(thing)
	interact_label.redraw()
	
#Function that will check if moving, only idle animations right now
func select_animation():
	if velocity == Vector2.ZERO:
		playback.travel("IDLE")
	else:
		playback.travel("WALKING")

func force_idle():
	playback.travel("IDLE")
#Function that updates animation, buddy who made the tutorial i followed LOVED new functions
func update_animation_parameters(input_direction):
	if input_direction == Vector2.ZERO:
		return
	animation_tree["parameters/IDLE/blend_position"] = input_direction
	animation_tree["parameters/WALKING/blend_position"] = input_direction
