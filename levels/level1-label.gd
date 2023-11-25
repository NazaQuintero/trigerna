extends Label
@onready var keyboard_sound = $KeyboardTyping

func _ready():
	keyboard_sound.play()
	self.text = get_parent().level_name
	var tween = create_tween()
	tween.tween_property(self, "visible_ratio", 1, 1.5)
	tween.set_trans(Tween.TRANS_CUBIC)

func _on_audio_stream_player_2d_finished():
	queue_free()
	get_parent().start_sound()
