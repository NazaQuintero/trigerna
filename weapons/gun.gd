extends RangedWeapon

const PROJECTILE_SCENE = preload("res://weapons/gun_bullet.tscn")
@onready var GUN_SHOT = $GunShot


func _throw_projectile() -> void:
	if enable_attack:
		var projectile_init = PROJECTILE_SCENE.instantiate()
		projectile_speed = 350
		get_tree().current_scene.add_child(projectile_init)	
		GUN_SHOT.play()
		projectile_init.launch(global_position, mouse_direction, projectile_speed)
		enable_attack = false
		cooldown_timer.start()
