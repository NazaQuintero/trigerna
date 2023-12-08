extends Control

@export var weapons: Array = []

@onready var slots: Array = $GridContainer.get_children()

func unselect_all():
	for slot in slots:
		slot.set_selected(false)
		
func select_slot(pos: int):
	unselect_all()
	slots[pos].set_selected(true)

func _input(event):
	if event.is_action_pressed("ui_first_weapon"):
		select_slot(0)
	elif event.is_action_pressed("ui_second_weapon"):
		select_slot(1)
	elif event.is_action_pressed("ui_third_weapon"):
		select_slot(2)
	elif event.is_action_pressed("ui_fourth_weapon"):
		select_slot(3)


func _ready():
	update_slots()
	
	
func set_weapons(new_weapons):
	weapons = new_weapons
	update_slots()
	
func update_slots():
	print('equipped_weapons: ', weapons)
	for i in range(min(weapons.size(), slots.size())):
		slots[i].update(weapons[i])
