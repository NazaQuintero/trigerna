extends Enemy
class_name Goblin


const MAX_DISTANCE_TO_PLAYER: int = 80
const MIN_DISTANCE_TO_PLAYER: int = 40


var knife = preload("res://weapons/throwing_knife.tscn")
var distance_to_player: float
@onready var attack_timer: Timer = $AttackTimer
@export var projectile_speed: int = 150
var enable_attack: bool = true


func _on_path_timer_timeout() -> void:
	if is_instance_valid(player):
		distance_to_player = (player.position - global_position).length()
		if distance_to_player > MAX_DISTANCE_TO_PLAYER:
			_get_path_to_player()
		elif distance_to_player < MIN_DISTANCE_TO_PLAYER:
			_get_path_to_move_away_from_player()
		else:
			if enable_attack:
				enable_attack = false
				_throw_knife()
				attack_timer.start()
	else:
		path_timer.stop()
		mov_direction = Vector2.ZERO


func _get_path_to_move_away_from_player() -> void:
	var direction: Vector2 = _get_player_position()
	navigation_agent.target_position = (global_position + direction)*100


func _throw_knife() -> void:
	var knife_init = knife.instantiate()
	knife_init.launch(global_position, _get_player_position(), projectile_speed)
	get_tree().current_scene.add_child(knife_init)


func _on_timer_timeout() -> void:
	enable_attack = true


func _get_player_position( )-> Vector2:
	return (player.position - global_position).normalized()

