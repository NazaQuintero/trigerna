extends Node
class_name SceneTransition

@onready var transition = $TransitionFade

func change_scene(scene_name : String) -> void:
	transition.play("fade_out")
	await transition.animation_finished
	Global.get_tree().change_scene_to_file(scene_name)

