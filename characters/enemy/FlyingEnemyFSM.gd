extends FiniteStateMachine


func _init() -> void:
	_add_state("chase")
	_add_state("hurt")
	_add_state("dead")
	_add_state("stun")


func _ready() -> void:
	_set_state(states.chase)


func _state_logic(_delta: float) -> void:
	match state:
		states.chase:
			parent.chase()
			parent.move()


func _get_transition() -> int:
	match state:
		states.hurt:
			if not animation_player.is_playing():
				return states.chase
		states.stun:
			if not animation_player.is_playing():
				return states.chase
	return -1


func _enter_state(_previous_state: int, new_state: int) -> void:
	match new_state:
		states.chase:
			animation_player.play("move")
		states.hurt:
			animation_player.play("hurt")
			punch_sound.play()
		states.dead:
			animation_player.play("dead")
			flying_enemy_death_sound.play()
		states.stun:
			animation_player.play("stun")
