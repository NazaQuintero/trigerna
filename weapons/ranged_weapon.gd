extends Weapon
class_name RangedWeapon


var projectile_scene: PackedScene
var projectile_speed: int = 150
@onready var cooldown_timer: Timer = $CooldownTimer
var enable_attack: bool = true


func _get_input() -> void:
	if Input.is_action_just_pressed("ui_attack"):
		_throw_projectile()


func _throw_projectile() -> void:
	pass


func _on_timer_timeout() -> void:
	enable_attack = true
