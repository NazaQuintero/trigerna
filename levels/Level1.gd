extends Level

var enemies  = [
	preload("res://characters/enemy/flyingEnemy/flying_enemy.tscn"),
	preload("res://characters/enemy/Goblin/goblin.tscn")
]
signal level_completed(lvl : String)
@onready var timer_level_1 = $TimerLevel1
@onready var spawn_timer = $SpawnTimer


func _ready():
	super()
	timer_level_1.start()
	spawn_timer.start()
	_set_enemies(enemies)

func _on_timer_level_1_timeout():
	_switch_level(level_name)
	
func _on_spawn_timer_timeout():
	_spawn_enemies()
	pass
	
