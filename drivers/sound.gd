extends Node

enum BGM {
	TITLE_THEME,
	HOUSE_THEME,
	MINIGAME,
	SINISTER,
}
const bgm_resources:Array[String] = [
	"res://drivers/audio/title.ogg"
]

var global_bgm_volume:float
var global_sfx_volume:float
var bgm_player:AudioStreamPlayer
var sfx_players:Array[AudioStreamPlayer]

func _ready():
	self.bgm_player = AudioStreamPlayer.new()
	self.add_child(bgm_player)

func play_bgm(songID:BGM, volume:float, fade_time:float):
	play_audio(bgm_resources[songID], self.bgm_player, volume*global_bgm_volume, fade_time)

func play_sfx(filepath:String, volume:float):
	var player:AudioStreamPlayer = AudioStreamPlayer.new()
	player.finished.connect(self.stop_audio.bind(player, 0, true))
	
	self.add_child(player)
	play_audio(filepath, player, volume, 0)
	

func play_audio(filepath:String, player:AudioStreamPlayer, volume:float, fade_len:float):
	var t = create_tween()
	t.set_trans(Tween.TRANS_EXPO)
	t.set_ease(Tween.EASE_IN)
	t.finished.connect(t.kill)
	
	player.volume_db = -80
	player.stream = load(filepath)
	player.play()
	t.tween_property(player, "volume_db", linear_to_db(volume), fade_len)
	return player

func stop_audio(p:AudioStreamPlayer, duration:float, kill:bool = false):
	var t = create_tween()
	t.set_trans(Tween.TRANS_EXPO)
	t.set_ease(Tween.EASE_OUT)
	t.tween_property(p, "volume_db", -60, duration)
	await t.finished
	t.kill()
	
	p.stop()
	if kill:
		p.get_parent().remove_child(p)
		p.queue_free()
