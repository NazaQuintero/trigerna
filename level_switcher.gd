extends Node
class_name LevelSwitcher

var next_level
var scene_transition =  preload("res://scene_transition.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

	

func _level_handler(level_name: String) -> void:
	match level_name:
		"Level1":
			next_level = "level_2"
		"Level2":
			next_level = "player_won" # falta hacer esta escena
		_:
			return
	var transition = scene_transition.instantiate()
	get_tree().current_scene.get_parent().add_child(scene_transition)
	transition.change_scene("res://"+ next_level + ".tscn")


func _player_lose() -> void:
	Global.get_tree().change_scene_to_file("res://.tscn") # Escena pierde


func _on_transition_animation_finished(anim_name):
	pass
