extends Hitbox

@onready var parent: CharacterBody2D = get_parent()
@export var stun_time: int = 2

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body == null or not body.has_method("take_damage"):
		queue_free()
	else:
		knockback_direction = parent.mov_direction
		body.take_damage(damage, knockback_direction, knockback_force)
		parent.stun()
