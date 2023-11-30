extends Level


var enemies  = [
	preload("res://characters/enemy/flyingEnemy/flying_enemy.tscn"),
	preload("res://characters/enemy/Goblin/goblin.tscn")
]

@onready var timer_level = $TimerLevel
@onready var spawn_timer = $SpawnTimer


func _ready():
	timer_level.start()
	spawn_timer.start()
	_set_enemies(enemies)


func _on_spawn_timer_timeout():
	_spawn_enemies()
	pass


func _on_timer_level_timeout():
	_switch_level(level_name) 
