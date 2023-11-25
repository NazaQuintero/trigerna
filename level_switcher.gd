extends Node
class_name LevelSwitcher

var next_level
@onready var transition = $TransitionFade
@onready var game = get_tree().current_scene

func _level_handler(level_name: String) -> void:
	match level_name:
		"level_menu":
			next_level = "level_1"
		"level_1":
			next_level = "level_2"
		"level_2":
			next_level = "level_1" # falta hacer esta escena player_won
		_:
			return
	transition.play("fade_in")


func _player_lose() -> void:
	game.change_level("res://.tscn")


func change_level() -> void:
	game.change_level("res://levels/"+ next_level + ".tscn")
