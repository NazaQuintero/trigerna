extends Control

#@onready var inventory: Inventory = preload("res://inventory/player_weapons.tres")
@export var weapons: Array = []

@onready var slots: Array = $GridContainer.get_children()

func _ready():
	update_slots()
	
func set_weapons(new_weapons):
	weapons = new_weapons
	update_slots()
	
func update_slots():
	print('equipped_weapons: ', weapons)
	for i in range(min(weapons.size(), slots.size())):
		slots[i].update(weapons[i])
