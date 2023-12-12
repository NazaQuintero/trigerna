extends Projectile
class_name Missile

func _init() -> void:
	super()
	method_to_check = "is_hit_by_enemy"

func _set_collisions() -> void:
	set_collision_mask_value(Global.MASK_LAYER_WORLD, true)
	set_collision_mask_value(Global.MASK_LAYER_PLAYER, true)

