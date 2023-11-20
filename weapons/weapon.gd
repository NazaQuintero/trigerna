extends Node2D
class_name Weapon


@onready var hitbox: Area2D = get_node("Node2D/Sprite2D/Hitbox")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var mouse_direction: Vector2


func _get_input() -> void:
	pass


func move(mouse_dir: Vector2) -> void:
	mouse_direction = mouse_dir
	rotation = mouse_dir.angle()
	hitbox.knockback_direction = mouse_dir
	if scale.y == 1 and mouse_dir.x < 0:
		scale.y = -1
	if scale.y == -1 and mouse_dir.x > 0:
		scale.y = 1


func is_busy() -> void:
	pass

