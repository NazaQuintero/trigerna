extends Enemy
class_name Boss

var missile = preload("res://weapons/missile.tscn")
@onready var animation = $AnimatedSprite2D
@onready var boss_states = $BossFMS
@onready var screen_size: Vector2 = get_viewport_rect().size

var center_margin = 5
var go_center = true

func _ready():
	position = Vector2(randi_range(-160, 670), randi_range(-90, 390))

func _process(delta):
	update_movement()

func update_movement():
	if go_center:
		move_to_center()
	else:
		move_towards_player()

func move_to_center():
	var distance_to_center = (screen_size / 2 - global_position).length()
	mov_direction = (screen_size / 2 - global_position).normalized() if distance_to_center > center_margin else Vector2.ZERO

func move_towards_player():
	var distance_to_player = player.position.distance_to(global_position)
	mov_direction = (player.position - position).normalized() if distance_to_player > center_margin else Vector2.ZERO
	if mov_direction.x < 0:
		animation.flip_h = true
	else:
		animation.flip_h = false
	

func _on_detection_area_body_entered(body):
	go_center = false	
	
func _on_attack_timer_timeout():
	if player:
		boss_states._set_state(boss_states.states.attack)
		shoot()
 
func shoot():
	var missile_instance = missile.instantiate()
	var offset = Vector2(30, -13) # Agrego este offset porque la posicion del sprite y el collision shape no es (0,0)
	missile_instance.launch(global_position + offset, (player.position - global_position).normalized(), 200)
	get_tree().current_scene.add_child(missile_instance)

func _on_detection_area_body_exited(body):
	go_center = true
