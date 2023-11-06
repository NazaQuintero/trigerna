extends Area2D


signal damage_body(damage)

var damage: int = 1
var collisionShape: CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	collisionShape = get_child(0)


func _on_body_entered(body: CollisionObject2D):
	emit_signal("damage_body", damage)