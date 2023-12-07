extends Control

@onready var inventory: Inventory = preload("res://inventory/player_weapons.tres")
@onready var slots: Array = get_children()

func _ready():
	update_slots()
	
func update_slots():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])
