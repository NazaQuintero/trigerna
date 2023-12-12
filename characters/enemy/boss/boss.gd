extends Enemy
class_name Boss

var missile = preload("res://weapons/missile.tscn")
@onready var animation = $AnimatedSprite2D
@onready var boss_sm = $FiniteMachineState
@onready var screen_size: Vector2 = get_viewport_rect().size
var projectile_speed = 100
var center_margin = 5
var go_center = true
var enable_attack = false

func _ready():
	pass

func _process(delta):
	if go_center:
		var distance_to_center = (screen_size / 2 - global_position).length()
		if distance_to_center > center_margin:
			mov_direction = (screen_size / 2 - global_position).normalized()
		else:
			mov_direction = Vector2.ZERO
	else:
		mov_direction = player.position - position
		if mov_direction.x < 0:
			animation.flip_h = true
		else:
			animation.flip_h = false
			
func _on_detection_area_body_entered(body):
	if is_instance_valid(player) and enable_attack:
		go_center = false
		enable_attack = false
		var missile_init = missile.instantiate()
		get_tree().current_scene.add_child(missile_init)
		boss_sm._set_state(boss_sm.states.attack)
		missile_init.launch(global_position, (player.position - global_position).normalized(), projectile_speed)

		
func _on_attack_timer_timeout():
	enable_attack = true

func _on_detection_area_body_exited(body):
	go_center = true
	boss_sm._set_state(boss_sm.states.idle)
