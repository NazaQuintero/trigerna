extends Control

var level = preload("res://level.tscn")
var player = preload("res://characters/player/player.tscn")
var scene_transition =  preload("res://scene_transition.tscn")
var transition

@onready var press_sound = $PressButton
func _ready():
	pass	

func _on_play_button_pressed() -> void:	
	press_sound.play()
	transition = scene_transition.instantiate()
	get_parent().add_child(transition)
	transition.change_scene("res://level_1.tscn")
	

func _on_quit_button_pressed() -> void:
	press_sound.play()
	get_tree().quit()

