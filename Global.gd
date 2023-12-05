extends Node

const MASK_LAYER_WORLD: int = 1
const MASK_LAYER_PLAYER: int = 2
const MASK_LAYER_ENEMY: int = 3
const MASK_LAYER_ITEM: int = 4

var collected_coins = 0

var shop_items = {
	0: {
		"name": "Potion",
		"desc": "An item useful to recover 50 points of life",
		"cost": 200,
		"texture": "res://art/props_itens/potion_red.png",
		"scaleX": 4,
		"scaleY": 4
	},
	1: {
		"name": "Crossbow",
		"desc": "A ranged weapon that fires arrows",
		"cost": 500,
		"texture": "res://art/weapons/crossbow.png",
		"scaleX": 0.05,
		"scaleY": 0.05
	},
	2: {
		"name": "Gun",
		"desc": "A ranged weapon that fires bullets",
		"cost": 1000,
		"texture": "res://art/weapons/pistola.png",
		"scaleX": 4,
		"scaleY": 4
	}
}


var instance


func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	get_tree().current_scene.add_node(node_instance)
	node_instance.global_position = location
	node_instance._initialize_values()
	return node_instance

