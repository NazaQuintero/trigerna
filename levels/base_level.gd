extends Node2D
class_name Level

@export var enemy_list: Array
@export var level_name = "Level"
@onready var ready_sound = $ReadyFight
@onready var timer_level = $TimerLevel
@onready var spawn_timer = $SpawnTimer
@onready var intro = $LevelIntro
var player = preload("res://characters/player/player.tscn")
	
func _ready() -> void:
	$Inventory_UI.set_weapons(Array(Global.level_equipped_weapons.values()))
	await intro.tree_exited 
	start()
	
	
func get_random_position() -> Vector2:
	return Vector2(randi_range(-160, 670), randi_range(-90, 390))

func is_in_visible_square_box(position: Vector2) -> bool:
	return position.x < 640 and position.x > -80 or position.y < 360 and position.y > -45

func _set_enemies(enemies: Array):
	enemy_list = enemies

func _spawn_enemies():
	var enemy_position = get_random_position()
	while is_in_visible_square_box(enemy_position):
		enemy_position = get_random_position()
		
	if !enemy_list.is_empty():
		Global.instance_node(enemy_list.pick_random(), enemy_position, self)
	
func _player_died() -> void:
	connect("player_died", Callable(self, "_lose"))

func _lose() -> void:
	Switcher._player_lose()

func start() -> void:
	ready_sound.play()
	timer_level.start()
	spawn_timer.start()


func _on_spawn_timer_timeout():
	_spawn_enemies()


func _on_timer_level_timeout():
#	Switcher._level_handler(level_name)
	Switcher.change_next_level()
	
