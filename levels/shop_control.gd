extends Control


@onready var inventory: Inventory = preload("res://inventory/player_weapons.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	update_slots()
	
func update_slots():
	for i in range(min(inventory.items.size(), slots.size())):
		var item = inventory.items[i]
		slots[i].update(item)
