extends Control

func start_game():
<<<<<<< HEAD
	SignalBus.change_lvl.emit("res://levels/player/player.tscn", 1)
=======
	SignalBus.change_lvl.emit("res://levels/test_lvl/level.tscn", 1)
>>>>>>> aab58d05f6aa2fd622bd37e72ba11b6cc2ee90b3

func do_options():
	pass

func quit_game():
	get_tree().quit()
