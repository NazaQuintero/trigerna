extends Weapon
class_name RangedWeapon


var PROJECTILE_SCENE: PackedScene


func _get_input() -> void:
	if Input.is_action_just_pressed("ui_attack"):
		pass


