extends FiniteStateMachine


func _init() -> void:
	_add_state("idle")
	_add_state("run")
	_add_state("hurt")
	_add_state("dead")


func _ready() -> void:
	_set_state(states.idle)


func _state_logic(_delta: float) -> void:
	parent.get_input()
	parent.move()


func _get_transition():
	match state:
		states.idle:
			if parent.velocity.length() > 10:
				return states.run
		states.run:
			if parent.velocity.length() < 10:
				return states.idle
	return -1


func _enter_state(_previous_state: int, new_state: int) -> void:
	match new_state:
		states.idle:
			animation_player.play("idle")
		states.run:
			animation_player.play("run")


func _exit_state(_state: int) -> void:
	pass
