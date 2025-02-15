extends Control

func start_game():
	#SignalBus.change_lvl.emit("res://levels/player/player.tscn", 1)
	SignalBus.change_lvl.emit("res://levels/test_lvl/level.tscn", 1)

func do_options():
	pass

func quit_game():
	get_tree().quit()
