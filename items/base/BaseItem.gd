extends Area2D
class_name BaseItem

@onready var animation = $AnimatedSprite2D
@onready var collected_sound = $CollectedSound

@export var value: int

func _on_body_entered(body):
	pass


