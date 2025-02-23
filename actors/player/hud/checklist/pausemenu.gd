extends Control

const SWEEP_TIME:float = 1.5

@onready var clipboard_img: TextureRect = $TextureRect
@onready var tasks:Array[HBoxContainer] = [
	$TextureRect/VBoxContainer/HBoxContainer,
	$TextureRect/VBoxContainer/HBoxContainer2,
	$TextureRect/VBoxContainer/HBoxContainer3
]

func _ready():
	self.hide()

func update_tasks():
	var i:int = 0
	for taskname:String in GlobalContext.goals.keys():
		tasks[i].get_child(0).button_pressed = GlobalContext.goals[taskname]
		tasks[i].get_child(1).text = taskname
		i += 1

func show_clipboard():
	update_tasks()
	self.show()
	GlobalContext.level_node.process_mode = Node.PROCESS_MODE_DISABLED
	
	var t = create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	t.tween_property(clipboard_img, "anchor_bottom", 1, SWEEP_TIME)
	t.parallel().tween_property(clipboard_img, "anchor_top", 0, SWEEP_TIME)

func hide_clipboard():
	var t = create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
	t.tween_property(clipboard_img, "anchor_bottom", 2, SWEEP_TIME/2)
	t.parallel().tween_property(clipboard_img, "anchor_top", 1, SWEEP_TIME/2)
	
	await t.finished
	self.hide()
	GlobalContext.level_node.process_mode = Node.PROCESS_MODE_INHERIT
