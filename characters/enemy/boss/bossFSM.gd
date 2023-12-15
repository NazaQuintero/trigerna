extends FiniteStateMachine

func _init():
	_add_state("hurt")
	_add_state("dead")
	_add_state("idle")
	_add_state("attack")

func _ready() -> void:
	_set_state(states.idle)


func _state_logic(_delta: float) -> void:
	if states.idle:
		parent.move()

func _get_transition() -> int:
	match state:
		states.hurt:
			if not animation_player.is_playing():
				return states.idle
		states.attack:
			if not animation_player.is_playing():
				return states.idle
	return -1


func _enter_state(_previous_state: int, new_state: int) -> void:
	match new_state:
		states.idle:
			animation_player.play("glowing")
		states.hurt:
			animation_player.play("defense")
		states.attack:
			animation_player.play("missile_attack")
		states.dead:
			animation_player.play("dead")
			Switcher._player_wins()

