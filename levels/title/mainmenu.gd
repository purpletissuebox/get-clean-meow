extends Control

func start_game():
	SignalBus.change_lvl.emit("res://levels/title/mainmenu.tscn", 1)

func do_options():
	pass

func quit_game():
	get_tree().quit()
