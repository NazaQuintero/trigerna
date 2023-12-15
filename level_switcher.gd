extends Node
class_name LevelSwitcher

var next_level
@onready var transition = $TransitionFade
@onready var game = get_tree().current_scene

const base_levels = [
		"start_menu",
		"level_1",
		"/shop/shop",
		"level_2",
		"/shop/shop",
		"level_3"
	]
	
var levels_to_play = base_levels.duplicate()

func _level_handler(level_name: String) -> void:
	match level_name:
		"level_menu":
			next_level = "level_1"
		"Level 1":
			next_level = "/shop/shop"
		"shop":
			next_level = "level_2"
		"Level 2":
			next_level = "level_3" # falta hacer esta escena player_won
		_:
			return
	transition.play("fade_in")


func _player_lose() -> void:
	game.change_level("res://levels/game_over_menu.tscn")

func _player_wins() -> void:
	game.change_level("res://levels/win.tscn")


func change_level() -> void:
	game.change_level("res://levels/"+ next_level + ".tscn")
	
func change_next_level() -> void:
	levels_to_play.remove_at(0)
	game.change_level("res://levels/"+ levels_to_play[0] + ".tscn")
	
func reset_levels() -> void:
	levels_to_play = base_levels
	change_next_level()
