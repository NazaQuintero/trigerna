extends Node
class_name SceneTransition

@onready var transition = $TransitionFade
var switcher

func change_scene(level_switch: Node) -> void:
	switcher = level_switch
	transition.play("fade_in")


func trigger_switch() -> void:
	switcher.change_scene()
