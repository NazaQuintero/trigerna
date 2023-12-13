extends CanvasLayer

@onready var player = get_parent()
@onready var bar = $TextureProgressBar

func _ready():
	pass # Replace with function body.

func _process(delta):
	bar.value = boss.hitpoints
