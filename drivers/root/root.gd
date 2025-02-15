extends Node
@export var screen_cover:ColorRect
@export var level:Node

func _ready():
	SignalBus.change_lvl.connect(self.load_new_lvl)
	SignalBus.change_lvl.emit("res://levels/title/mainmenu.tscn", 0)

func load_new_lvl(filepath:String, fade_time:float):
	var fadeout = create_tween()
	fadeout.tween_property(screen_cover, "modulate", Color(0,0,0,1), fade_time)
	await fadeout.finished
	
	var level_contents = level.get_child(0)
	level.remove_child(level_contents)
	level_contents.queue_free()
	
	level.add_child(load(filepath).instantiate())
	
	var fadein = create_tween()
	fadein.tween_property(screen_cover, "modulate", Color(0,0,0,0), fade_time)
