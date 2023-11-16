extends Node

func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	node_instance.hitpoints = 10
	node_instance.max_speed = 100
	node_instance.acceleration = 20
	node_instance.friction = 0.5
	return node_instance
