extends Character
class_name Enemy


@onready var player: CharacterBody2D = get_parent().get_node("Player")
@onready var path_timer: Timer = $PathTimer
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D


func _ready() -> void:
	if path_timer != null:
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


func stun() -> void:
	state_machine._set_state(state_machine.states.stun)


func _on_path_timer_timeout() -> void:
	if is_instance_valid(player):
		_get_path_to_player()
	else:
		path_timer.stop()
		mov_direction = Vector2.ZERO


func _get_path_to_player() -> void:
	navigation_agent.target_position = player.position


func get_droppable_item():
	Global.get_drop(self)


func drop_item(scene):
	var instance = scene.instantiate()
	instance.position = self.position
	get_parent().add_child(instance)


func is_hit_by_player() -> void:
	pass
