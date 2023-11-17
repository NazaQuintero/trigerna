extends Hitbox
class_name Projectile


var direction: Vector2 = Vector2.ZERO
var speed: int = 0


func launch(initial_position: Vector2, target_direction: Vector2, launch_speed: int) -> void:
	position = initial_position
	direction = target_direction
	knockback_direction = target_direction
	speed = launch_speed
	
	rotation = direction.angle()	


func _physics_process(delta: float) -> void:
	position += direction * speed * delta

