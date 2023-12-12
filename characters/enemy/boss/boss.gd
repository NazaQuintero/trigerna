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

func _ready() -> void:
	position = Vector2(randi_range(-160, 670), randi_range(-90, 390))

func _process(delta):
	if go_center:
		var distance_to_center = (screen_size / 2 - global_position).length()
		if distance_to_center > center_margin:
			mov_direction = (screen_size / 2 - global_position).normalized()
		else:
			mov_direction = Vector2.ZERO
	else:
		var distance_to_player = player.position.distance_to(global_position)
		if distance_to_player > center_margin:
			mov_direction = (player.position - position).normalized()
		else:
			mov_direction = Vector2.ZERO
	if mov_direction.x < 0:
		animation.flip_h = true
	else:
		animation.flip_h = false

func _on_detection_area_body_entered(body):
	if player and enable_attack:
		enable_attack = false
		go_center = false
		var missile_init = missile.instantiate()
		get_tree().current_scene.add_child(missile_init)
		boss_sm._set_state(boss_sm.states.attack)
		missile_init.launch(global_position, (player.position - global_position).normalized(), projectile_speed)

func _on_attack_timer_timeout():
	enable_attack = true

func _on_detection_area_body_exited(body):
	go_center = true
	boss_sm._set_state(boss_sm.states.idle)
