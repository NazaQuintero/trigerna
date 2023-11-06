extends CharacterBody2D
class_name Character

@export var friction: float = 0.5
@export var acceleration: int = 40
@export var max_speed: int = 100
@export var hitpoints: int = 2

@onready var state_machine: Node = get_node("FiniteStateMachine")
@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")

var mov_direction: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, friction)


func move() -> void:
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * acceleration
	velocity = velocity.limit_length(max_speed)


func take_damage(damage: int, direction: Vector2, force: int) -> void:
	hitpoints -= damage
	state_machine._set_state(state_machine.states.hurt)
	velocity += direction * force
