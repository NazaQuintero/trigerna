extends Node


const MASK_LAYER_WORLD: int = 1
const MASK_LAYER_PLAYER: int = 2
const MASK_LAYER_ENEMY: int = 3
const MASK_LAYER_ITEM: int = 4

var instance


	
func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	node_instance._initialize_values()
	return node_instance

