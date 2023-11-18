extends Projectile
class_name Arrow


func _init() -> void:
	super()
	method_to_check = "is_hit_by_player"


func _ready():
	set_collision_mask_value(Global.MASK_LAYER_WORLD, true)
	set_collision_mask_value(Global.MASK_LAYER_PLAYER, true)

