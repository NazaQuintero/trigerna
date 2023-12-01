extends CanvasLayer

@onready var player = get_parent().get_node("Player")
@onready var bar = $TextureProgressBar

func _ready():
	pass # Replace with function body.

func _process(delta):
	bar.value = player.hitpoints
