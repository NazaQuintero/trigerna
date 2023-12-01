extends Level

var enemies  = [
	preload("res://characters/enemy/flyingEnemy/flying_enemy.tscn"),
	preload("res://characters/enemy/slime/slime.tscn"),
]
signal level_completed(lvl : String)
@onready var timer_level = $TimerLevel
@onready var spawn_timer = $SpawnTimer
@onready var label = $Label

func _ready():
	timer_level.start()
	spawn_timer.start()
	_set_enemies(enemies)

func _on_timer_level_timeout():
	_switch_level(level_name)	
	
func _on_spawn_timer_timeout():
	_spawn_enemies()
	pass
