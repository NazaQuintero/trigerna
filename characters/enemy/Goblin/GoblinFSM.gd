extends FiniteStateMachine


func _init() -> void:
	_add_state("idle")
	_add_state("hurt")
	_add_state("move")
	_add_state("dead")


func _ready() -> void:
	_set_state(states.move)


func _state_logic(_delta: float) -> void:
	match state:
		states.move:
			parent.chase()
			parent.move()


func _get_transition() -> int:
	match state:
		states.hurt:
			if not animation_player.is_playing():
				return states.move
		states.idle:
			if parent.distance_to_player > parent.MAX_DISTANCE_TO_PLAYER or parent.distance_to_player < parent.MIN_DISTANCE_TO_PLAYER:
				return states.move
		states.move:
			if parent.distance_to_player < parent.MAX_DISTANCE_TO_PLAYER and parent.distance_to_player > parent.MIN_DISTANCE_TO_PLAYER:
				return states.move
	return -1


func _enter_state(_previous_state: int, new_state: int) -> void:
	match new_state:
		states.move:
			animation_player.play("move")
		states.hurt:
			animation_player.play("hurt")
		states.dead:
			animation_player.play("dead")
			parent.get_droppable_item()
		states.idle:
			animation_player.play("idle")
