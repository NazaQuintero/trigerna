extends Node

const MASK_LAYER_WORLD: int = 1
const MASK_LAYER_PLAYER: int = 2
const MASK_LAYER_ENEMY: int = 3
const MASK_LAYER_ITEM: int = 4

var collected_coins = 0

var shop_item_selected = 0

var current_weapon = 0

var shop_items = {
	0: {
		"name": "potion",
		"desc": "An item useful to recover 50 points of life",
		"cost": 200,
		"texture": "res://art/props_itens/potion_red.png",
		"scaleX": 4,
		"scaleY": 4
	},
	1: {
		"name": "crossbow",
		"desc": "A ranged weapon that fires arrows",
		"cost": 500,
		"texture": "res://art/weapons/crossbow.png",
		"scaleX": 0.05,
		"scaleY": 0.05
	},
	2: {
		"name": "gun",
		"desc": "A ranged weapon that fires bullets",
		"cost": 1000,
		"texture": "res://art/weapons/pistola.png",
		"scaleX": 4,
		"scaleY": 4
	}
}

var level_equipped_weapons_scale_cfg = {
	"fist": {
		"scale": Vector2(0.25, 0.25),
	},
	"crossbow" : {
		"scale": Vector2(0.02, 0.02)
	},
	"gun" : {
		"scale": Vector2(2.3, 2.3)
	}
}

var shop_equipped_weapons_scale_cfg = {
	"fist": {
		"scale": Vector2(0.3, 0.3),
	},
	"crossbow" : {
		"scale": Vector2(0.030, 0.030)
	},
	"gun" : {
		"scale": Vector2(3, 3)
	}
}

var shop_weapons = {
	"fist": {
		"texture": "res://art/weapons/glove_box.png",
		"scale" : shop_equipped_weapons_scale_cfg["fist"].scale
	},
	"crossbow": {
		"texture": "res://art/weapons/crossbow.png",
		"scale": shop_equipped_weapons_scale_cfg["crossbow"].scale
	},
	"gun": {
		"texture": "res://art/weapons/pistola.png",
		"scale": shop_equipped_weapons_scale_cfg["gun"].scale
	}
}

var level_weapons = {
	"fist": {
		"texture": "res://art/weapons/glove_box.png",
		"scale" : level_equipped_weapons_scale_cfg["fist"].scale
	},
	"crossbow": {
		"texture": "res://art/weapons/crossbow.png",
		"scale": level_equipped_weapons_scale_cfg["crossbow"].scale
	},
	"gun": {
		"texture": "res://art/weapons/pistola.png",
		"scale": level_equipped_weapons_scale_cfg["gun"].scale
	}
}

var shop_equipped_weapons = {
	1: {
		"name": "fist",
		"texture": "res://art/weapons/glove_box.png",
		"scale" : shop_equipped_weapons_scale_cfg["fist"].scale
	},
}

var level_equipped_weapons = {
	1: {
		"name": "fist",
		"texture": "res://art/weapons/glove_box.png",
		"scale" : level_equipped_weapons_scale_cfg["fist"].scale
	}
}


var instance


func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	get_tree().current_scene.add_node(node_instance)
	node_instance.global_position = location
	node_instance._initialize_values()
	return node_instance

