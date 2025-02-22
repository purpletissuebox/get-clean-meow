extends Control

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

func cancelTween():
	if self.movementT:
		self.movementT.kill()
		self.movementT = null
