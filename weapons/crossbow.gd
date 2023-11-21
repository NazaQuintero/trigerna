extends RangedWeapon


const PROJECTILE_SCENE = preload("res://weapons/arrow.tscn")
@onready var ARROW_THROWN_AUDIO = $ArrowThrown


func _throw_projectile() -> void:
	if enable_attack:
		var projectile_init = PROJECTILE_SCENE.instantiate()
		get_tree().current_scene.add_child(projectile_init)	
		ARROW_THROWN_AUDIO.play()
		projectile_init.launch(global_position, mouse_direction, projectile_speed)
		enable_attack = false
		cooldown_timer.start()
