extends CharacterBody2D
class_name Character


@export var friction: float = 0.5
@export var acceleration: int = 40
@export var max_speed: int = 100
@export var hitpoints: int = 100  :
	set (new_hitpoints):
		hitpoints = new_hitpoints
	get:
		return hitpoints
signal hitpoints_changed(new_hitpoints)


@onready var state_machine: Node = $FiniteStateMachine
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collectedCoins = get_tree().current_scene.get_node("CoinsCounterUi").get_child(0)
var mov_direction: Vector2 = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, friction)
	collectedCoins.text = "Coins: " + str(CoinsCounter.coins)


func move() -> void:
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * acceleration
	velocity = velocity.limit_length(max_speed)


func take_damage(damage: int, direction: Vector2, force: int) -> void:
	self.hitpoints -= damage
	velocity = direction * force
	if hitpoints > 0:
		state_machine._set_state(state_machine.states.hurt)
	else:
		state_machine._set_state(state_machine.states.dead)
		velocity *= 2

