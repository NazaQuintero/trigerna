extends Enemy
class_name Boss

var missile = preload("res://weapons/missile.tscn")
@onready var animation = $AnimatedSprite2D
@onready var boss_state = $FiniteMachineState
@onready var screen_size: Vector2 = get_viewport_rect().size
var projectile_speed = 100

var center_margin = 5
var go_center : bool = true

func _ready():
	position = (screen_size / 2 )

func _process(delta):
	mov_direction = Vector2.ZERO	
	var direction = (player.position - position).normalized()
	if direction.x < 0:
		animation.flip_h = true
	else:
		animation.flip_h = false

func _on_attack_timer_timeout():
	if is_instance_valid(player):
		boss_state._set_state(boss_state.states.attack)
		var missile_init = missile.instantiate()
		get_tree().current_scene.add_child(missile_init)
		missile_init.launch(global_position, (player.position - global_position).normalized(), projectile_speed)

