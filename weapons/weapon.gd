extends Node2D
class_name Weapon

@onready var hitbox: Area2D = $Hitbox
@onready var animation_player: AnimationPlayer = $WeaponAnimationPlayer


func get_input() -> void:
	if Input.is_action_just_pressed("ui_attack") and not animation_player.is_playing():
		animation_player.play("attack")


func move(mouse_direction: Vector2) -> void:
	rotation = mouse_direction.angle()
	hitbox.knockback_direction = mouse_direction
	if scale.y == 1 and mouse_direction.x < 0:
		scale.y = -1
	if scale.y == -1 and mouse_direction.x > 0:
		scale.y = 1
