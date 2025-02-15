class_name PlayerController extends CharacterBody2D

const BASE_DIR:Vector2 = Vector2(1,0.75)
const BASE_SPEED:float = 150

@onready var camera_2d: Camera2D = $Camera2D
@onready var interact_label: HBoxContainer = $InteractLabel

var busy:bool
var nearby_interactables:Array[Interactable]

func _init():
	GlobalContext.player_node = self

func _physics_process(_delta:float):
	if Input.is_action_just_pressed("interact"):
		if self.nearby_interactables.size() != 0:
			self.nearby_interactables[-1]._interact([])
	
	var dir = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	self.velocity = dir*BASE_SPEED*BASE_DIR
	move_and_slide()

func approached_object(thing:Interactable):
	self.nearby_interactables.append(thing)
	interact_label.redraw()

func left_object(thing:Interactable):
	self.nearby_interactables.erase(thing)
	interact_label.redraw()
