extends CanvasLayer

@onready var transition = self.get_node("TransitionFade")

func change_scene(scene_name : String) -> void:
	transition.play("fade_out")
	await transition.animation_finished
	get_tree().change_scene_to_file(scene_name)

