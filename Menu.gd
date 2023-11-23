extends Control

var level = preload("res://levels/level.tscn")
var player = preload("res://characters/player/player.tscn")
var transition

@onready var press_sound = $PressButton
@onready var level_switcher = get_parent().get_node("LevelSwitcher")
func _ready():
	pass


func _on_play_button_pressed() -> void:	
	press_sound.play()
	level_switcher._level_handler("Level0")


func _on_quit_button_pressed() -> void:
	press_sound.play()
	get_tree().quit()

