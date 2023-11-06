extends CharacterBody2D

class_name Enemy

var speed = 300
@onready var visitor = $"../Player"

func _physics_process(delta):
	if visitor == null: get_tree().get_nodes_in_group("Player")[0]
	if visitor != null:
		velocity = position.direction_to(visitor.position)*speed
		$AnimatedSprite2D.rotate(velocity.angle()*delta)
		move_and_slide()
