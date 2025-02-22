extends Control

const SWEEP_TIME:float = 1.5

@onready var clipboard_img: TextureRect = $TextureRect

func _ready():
	self.hide()

func show_clipboard():
	self.show()
	get_tree().paused = true
	
	var t = create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	t.tween_property(clipboard_img, "anchor_bottom", 1, SWEEP_TIME)
	t.parallel().tween_property(clipboard_img, "anchor_top", 0, SWEEP_TIME)

func hide_clipboard():
	var t = create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN)
	t.tween_property(clipboard_img, "anchor_bottom", 2, SWEEP_TIME)
	t.parallel().tween_property(clipboard_img, "anchor_top", 1, SWEEP_TIME)
	
	await t.finished
	self.hide()
	get_tree().paused = false
