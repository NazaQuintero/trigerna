extends Node2D
class_name Weapon

@onready var hitbox: Area2D = get_node("Node2D/Sprite2D/Hitbox")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var slash = $slash

func get_input() -> void:
	if Input.is_action_just_pressed("ui_attack") and not animation_player.is_playing():
		animation_player.play("attack")
		slash.play()


func move(mouse_direction: Vector2) -> void:
	rotation = mouse_direction.angle()
	hitbox.knockback_direction = mouse_direction
	if scale.y == 1 and mouse_direction.x < 0:
		scale.y = -1
	if scale.y == -1 and mouse_direction.x > 0:
		scale.y = 1


func is_busy() -> void:
	pass
