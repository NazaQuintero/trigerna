extends Hitbox
class_name GoblinKnife

var direction: Vector2 = Vector2.ZERO
var knife_speed: int = 200
var enemy_exited: bool = false

func launch(init_pos: Vector2, dir: Vector2, speed: int) -> void:
	position = init_pos
	direction = dir
	knockback_direction = dir
	knife_speed = speed
	#rotation += position.angle()*knife_speed	

func _physics_process(delta: float) -> void:
	position += direction * knife_speed * delta


func _on_body_exited(body: PhysicsBody2D):
	if body == null and not enemy_exited:
		enemy_exited = true
		set_collision_mask_value(0, true) # Enable world mask
		set_collision_mask_value(1, true) # Enable player mask
	

func _on_body_entered(body: PhysicsBody2D) -> void:
	if enemy_exited:
		if body != null:
			body.take_damage(damage, knockback_direction, knockback_force)
		queue_free()
