extends Projectile
class_name Arrow


func _ready():
	set_collision_mask_value(Global.MASK_LAYER_WORLD, true)
	set_collision_mask_value(Global.MASK_LAYER_ENEMY, true)

