extends Control

signal advance
signal init_choice
signal choose
const LETTERS_PER_SECOND:float = 20.0
const ENTRY_TIME:float = 1.0

@onready var textbox: RichTextLabel = $NinePatchRect/MarginContainer/RichTextLabel
@onready var advance_icon: TextureRect = $NinePatchRect/MarginContainer/TextureRect

var t:Tween = null

func _ready():
	self.advance.connect(self.skipText)
	SignalBus.trigger_conversation.connect(self.startConversation)
	
	SignalBus.trigger_conversation.emit(load("res://actors/player/hud/test_convo.tres"))

func _process(delta:float):
	if Input.is_action_just_pressed("interact"):
		advance.emit()

func startConversation(convo:Conversation):
	textbox.visible_ratio = 0
	advance_icon.hide()
	var t2 = create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	t2.tween_property(self, "anchor_bottom", (2 - 64.0/240.0), ENTRY_TIME)
	t2.parallel().tween_property(self, "anchor_top", (1 - 64.0/240.0), ENTRY_TIME)
	
	await t2.finished
	printConversation(convo, 0, [])

func endConversation(choices:Array[int]):
	var t2 = create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	t2.tween_property(self, "anchor_bottom", 2, ENTRY_TIME)
	t2.parallel().tween_property(self, "anchor_top", 1, ENTRY_TIME)
	
	await t2.finished
	SignalBus.conversation_ended.emit(choices)

func printConversation(convo:Conversation, depth:int, choiceBuf:Array[int]):
	for dialog in convo.contents:
		advance_icon.hide()
		textbox.visible_ratio = 0
		textbox.text = dialog.text #clear textbox in preparation
		
		self.t = create_tween()
		t.tween_property(textbox, "visible_ratio", 1, dialog.text.length()/LETTERS_PER_SECOND)
		await t.finished #wait for text to finish printing
		
		advance_icon.show()
		await advance #wait for user to hit E
		
		if dialog.choices.size(): #handle options
			var txt = "   "
			for opt in dialog.choices:
				txt += (opt.prompt + "\n   ") #buffer all of the text to display at once
				
			textbox.text = txt
			init_choice.emit(dialog.choices.size())
			var choiceID = await choose #wait for user to pick one
			
			choiceBuf.append(choiceID)
			if dialog.choices[choiceID].continuation != null: #handle case where choice leads to nothing
				await printConversation(dialog.choices[choiceID].continuation, depth+1, choiceBuf)
	
	if depth == 0:
		self.endConversation(choiceBuf)

func skipText():
	if self.t:
		textbox.visible_ratio = 1
		t.finished.emit()
		t.kill()
		self.t = null
