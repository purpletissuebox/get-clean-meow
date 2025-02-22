extends HBoxContainer

func update_vol(x:float):
	SoundDriver.global_bgm_volume = x
	SoundDriver.global_sfx_volume = x
	SoundDriver.bgm_player.volume_db = linear_to_db(x)
