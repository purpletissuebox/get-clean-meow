extends Control

@export var dialog_manager:Control
var id:int
var num_options:int
var textbox:RichTextLabel
var active:bool = false
var block:bool = true

func _ready():
	dialog_manager.init_choice.connect(self.start)

func _process(delta:float):
	if !self.active:
		return
	if self.block:
		self.block = 0
		return
	
	if Input.is_action_just_pressed("walk_down"):
		moveCursor(+1)
	elif Input.is_action_just_pressed("walk_up"):
		moveCursor(-1)
	elif Input.is_action_just_pressed("interact"):
		self.active = 0
		dialog_manager.choose.emit(self.id)

func moveCursor(amt:int):
	replaceSecondCharOnLine(self.id, " ")
	self.id += amt
	self.id = posmod(self.id, self.num_options)
	replaceSecondCharOnLine(self.id, ">")

func replaceSecondCharOnLine(l:int, c:String):
	var i:int = 0
	var j:int = 0
	
	while i != l:
		if textbox.text[j] == "\n":
			i += 1
		j += 1
	
	j += 1
	textbox.text[j] = c

func start(N:int):
	self.textbox = dialog_manager.textbox
	self.active = 1
	self.id = 0
	self.num_options = N
	self.block = 1
	dialog_manager.textbox.text[1] = ">"
