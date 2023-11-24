extends Node2D


@onready var selected_scene = $SelectedScene


func change_level(level_scene: String) -> void:
	selected_scene.get_child(0).queue_free()
	var level_instance = load(level_scene).instantiate()
	selected_scene.add_child(level_instance)


func add_node(node_instance) -> void:
	selected_scene.get_child(0).add_child(node_instance)
