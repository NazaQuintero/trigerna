extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/weapon_display

@onready var selected_container = $PanelContainer

@export var selected = false

func _ready():
	if (not selected):
		selected_container.visible = false

func update(item):
	if !item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = load(item.texture)
		item_visual.scale.x = item.scaleX
		item_visual.scale.y = item.scaleY
