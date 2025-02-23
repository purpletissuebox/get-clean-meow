extends HBoxContainer

@onready var h_slider: HSlider = $HSlider

func _ready():
	h_slider.ratio = SoundDriver.global_bgm_volume

func update_vol(x:float):
	SoundDriver.global_bgm_volume = x
	SoundDriver.global_sfx_volume = x
	SoundDriver.bgm_player.volume_db = linear_to_db(x)
