extends Node
class_name LevelSwitcher

var next_level


func _level_handler(level_name: String) -> void:
	match level_name:
		"Level0":
			next_level = "level_1"
		"Level1":
			next_level = "level_2"
		"Level2":
			next_level = "player_won" # falta hacer esta escena
		_:
			return
	# get_tree().current_scene.get_parent().add_child(scene_transition)
	Transition.change_scene(self)


func _player_lose() -> void:
	Global.get_tree().change_scene_to_file("res://.tscn") # Escena pierde


func change_scene() -> void:
	print_debug("change_scene")
	Global.get_tree().change_scene_to_file("res://levels/"+ next_level + ".tscn")

func _on_transition_animation_finished(anim_name):
	pass
