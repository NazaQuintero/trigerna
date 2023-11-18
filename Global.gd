extends Node


const MASK_LAYER_WORLD: int = 0
const MASK_LAYER_PLAYER: int = 1
const MASK_LAYER_ENEMY: int = 2
const MASK_LAYER_ITEM: int = 3


func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	node_instance._initialize_values()
	return node_instance
