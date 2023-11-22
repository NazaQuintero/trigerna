extends Control

var level = preload("res://level.tscn")
var player = preload("res://characters/player/player.tscn")
@onready var press_sound = $PressButton
func _ready():
	pass	

func _on_play_button_pressed() -> void:	
	press_sound.play()
	SceneTransition.change_scene("res://level_1.tscn")
	

func _on_quit_button_pressed() -> void:
	press_sound.play()
	get_tree().quit()

