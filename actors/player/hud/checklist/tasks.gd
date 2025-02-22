extends Control

var tasks:Dictionary

func display():
	get_tree().root.pause()
	self.show()

func register_task(task_name:String):
	if task_name in self.tasks:
		return
	
	self.tasks[task_name] = false
