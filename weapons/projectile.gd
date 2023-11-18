extends Hitbox
class_name Projectile


var direction: Vector2 = Vector2.ZERO
var projectile_speed: int = 200
var spawner_exited: bool = false
var method_to_check: String
@onready var screen_size: Vector2 = get_viewport_rect().size


func _init() -> void:
	super()
	connect("body_exited", Callable(self, "_on_body_exited"))


func _set_collisions() -> void:
	pass


func launch(init_pos: Vector2, dir: Vector2, speed: int) -> void:
	position = init_pos
	direction = dir
	knockback_direction = dir
	projectile_speed = speed
	rotation = dir.angle()


func _physics_process(delta: float) -> void:
	if position.x > screen_size.x or position.y > screen_size.y or position.x < 0 or position.y < 0:
		queue_free()
	position += direction * projectile_speed * delta


func _on_body_exited(body: PhysicsBody2D) -> void:
	if not spawner_exited:
		spawner_exited = true
		_set_collisions()


func _on_body_entered(body: PhysicsBody2D) -> void:
	if spawner_exited:
		if body.has_method(method_to_check):
			body.take_damage(damage, knockback_direction, knockback_force)
		queue_free()
