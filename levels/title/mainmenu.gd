extends Control

func _ready():
	SoundDriver.play_bgm(SoundDriver.BGM.TITLE_THEME, 0)

func start_game():
	SignalBus.change_lvl.emit("res://levels/test_lvl/level.tscn", 1)

func do_options():
	SignalBus.start_minigame.emit("res://minigames/scrub/game.tscn")

func quit_game():
	get_tree().quit()
