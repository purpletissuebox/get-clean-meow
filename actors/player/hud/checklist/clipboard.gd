extends Control

@export var pause_menu:Control

const TRAVEL_TIME:float = 0.75
const ANCHOR_DIFF:float = 0.19

@onready var texture_rect: TextureRect = $TextureRect

var movementT:Tween = null

func raise():
	cancelTween()
	movementT = create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	movementT.tween_property(texture_rect, "anchor_bottom", 1-ANCHOR_DIFF, TRAVEL_TIME)
	movementT.parallel().tween_property(texture_rect, "anchor_top", 1-ANCHOR_DIFF, TRAVEL_TIME)

func lower():
	cancelTween()
	movementT = create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	movementT.tween_property(texture_rect, "anchor_bottom", 1, TRAVEL_TIME)
	movementT.parallel().tween_property(texture_rect, "anchor_top", 1, TRAVEL_TIME)

func pauseGame(e:InputEvent):
	if e is not InputEventMouseButton:
		return
	
	if e.button_index == MOUSE_BUTTON_LEFT:
		self.pause_menu.show_clipboard()

func cancelTween():
	if self.movementT:
		self.movementT.kill()
		self.movementT = null
