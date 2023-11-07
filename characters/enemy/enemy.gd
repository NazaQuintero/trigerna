extends Character
class_name Enemy

@onready var player: CharacterBody2D = get_tree().current_scene.get_node("Player")
@onready var path_timer: Timer = $PathTimer
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

@export var detection_radius: int = 20

func _ready() -> void:
	path_timer.start()

func chase() -> void:
	if not navigation_agent.is_target_reached():	
		var vector_to_next_point: Vector2 = navigation_agent.get_next_path_position() - global_position
		mov_direction = vector_to_next_point
		
		if vector_to_next_point.x > 0 and animated_sprite.flip_h:
			animated_sprite.flip_h = false
		if vector_to_next_point.x < 0 and not animated_sprite.flip_h:
			animated_sprite.flip_h = true
	else:
		mov_direction = Vector2.ZERO


func _on_path_timer_timeout() -> void:
	if is_instance_valid(player):
		_get_path_to_player()
	else:
		path_timer.stop()
		mov_direction = Vector2.ZERO


func _get_path_to_player() -> void:
	navigation_agent.target_position = player.position
