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

var level_scale_cfg = {
	"fist": Vector2(0.25, 0.25),
	"crossbow" : Vector2(0.02, 0.02),
	"gun" : Vector2(2.3, 2.3)
}

var shop_scale_cfg = {
	"fist": Vector2(0.3, 0.3),
	"crossbow" : Vector2(0.030, 0.030),
	"gun" : Vector2(3, 3)
}

var weapons_textures = {
	"fist": "res://art/weapons/glove_box.png",
	"crossbow": "res://art/weapons/crossbow.png",
	"gun": "res://art/weapons/pistola.png"
}

var shop_weapons = {
	"fist": {
		"texture": weapons_textures["fist"],
		"scale" : shop_scale_cfg["fist"]
	},
	"crossbow": {
		"texture": weapons_textures["crossbow"],
		"scale": shop_scale_cfg["crossbow"]
	},
	"gun": {
		"texture": weapons_textures["gun"],
		"scale": shop_scale_cfg["gun"]
	}
}

var level_weapons = {
	"fist": {
		"texture": weapons_textures["fist"],
		"scale" : level_scale_cfg["fist"]
	},
	"crossbow": {
		"texture": weapons_textures["crossbow"],
		"scale": level_scale_cfg["crossbow"]
	},
	"gun": {
		"texture": weapons_textures["gun"],
		"scale": level_scale_cfg["gun"]
	}
}

var shop_equipped_weapons = {
	1: {
		"name": "fist",
		"texture": weapons_textures["fist"],
		"scale" : shop_scale_cfg["fist"]
	},
}

var level_equipped_weapons = {
	1: {
		"name": "fist",
		"texture": weapons_textures["fist"],
		"scale" : level_scale_cfg["fist"]
	}
}


var instance


func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	get_tree().current_scene.add_node(node_instance)
	node_instance.global_position = location
	node_instance._initialize_values()
	return node_instance

func create_shop_weapon(name: String, texture: String, scale: Vector2):
	return {
		"name": name,
		"texture": texture,
		"scale": scale
	}

func add_new_equipped_weapon(weapon_name: String):
	var texture = shop_weapons[weapon_name].texture
	var shop_scale = shop_weapons[weapon_name].scale
	var level_scale = level_weapons[weapon_name].scale
	var new_shop_weapon = create_shop_weapon(weapon_name, texture, shop_scale)
	var new_level_weapon = create_shop_weapon(weapon_name, texture, level_scale)
	
	shop_equipped_weapons.merge({ current_weapon: new_shop_weapon })
	level_equipped_weapons.merge({ current_weapon: new_level_weapon })

func get_selected_shop_item():
	return shop_items[shop_item_selected]
