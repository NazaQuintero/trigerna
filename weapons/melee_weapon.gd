extends Weapon
class_name MeleeWeapon


func _get_input() -> void:
	if Input.is_action_just_pressed("ui_attack") and not animation_player.is_playing():
		animation_player.play("attack")

