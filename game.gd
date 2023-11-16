extends Node2D

var enemy_1 = preload("res://characters/enemy/flying_enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_random_position() -> Vector2:
	return Vector2(randi_range(-160, 670), randi_range(-90, 390))
	
func is_in_visible_square_box(position: Vector2) -> bool:
	return position.x < 640 and position.x > -80 or position.y < 360 and position.y > -45

func _on_timer_timeout():
	var enemy_position = get_random_position()
	while is_in_visible_square_box(enemy_position):
		enemy_position = get_random_position()
		
	Global.instance_node(enemy_1, enemy_position, self)
		
	
