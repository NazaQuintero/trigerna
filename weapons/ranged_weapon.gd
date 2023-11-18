extends Weapon
class_name RangedWeapon


var PROJECTILE_SCENE: PackedScene
@export var projectile_speed: int = 150


func _get_input() -> void:
	if Input.is_action_just_pressed("ui_attack"):
		pass


func _throw_projectile() -> void:
	var projectile_init = PROJECTILE_SCENE.instantiate()
	projectile_init.launch(global_position, get_global_mouse_position(), projectile_speed)
	get_tree().current_scene.add_child(projectile_init)
