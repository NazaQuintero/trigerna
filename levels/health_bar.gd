extends CanvasLayer

@onready var character = get_parent()
@onready var bar = $TextureProgressBar

func _ready():
	pass # Replace with function body.

func _process(delta):
	bar.value = character.hitpoints
