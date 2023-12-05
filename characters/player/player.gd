extends Character

enum {FIRST, SECOND, THIRD}

const MAX_HITPOINTS = 100

@onready var screen_size: Vector2 = get_viewport_rect().size
@onready var weapons: Node2D = $Weapons
@onready var current_weapon: Node2D = weapons.get_child(0)

@onready var collectedCoins = get_parent().get_node("CoinsCounterUi").get_child(0)

@export var weapons_inventory: Inventory


var damage_modifier: int = 2


func _ready() -> void:
	position = screen_size / 2


func _process(_delta: float) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if mouse_direction.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mouse_direction.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
	
	current_weapon.move(mouse_direction)
	collectedCoins.text = "Coins: " + str(Global.collected_coins)


func increase_hitpoints(value: int):
	var new_hitpoints = self.hitpoints + value
	if new_hitpoints >= MAX_HITPOINTS:
		self.hitpoints = MAX_HITPOINTS
	else: 
		self.hitpoints = new_hitpoints

func increment_coins(value: int):
	Global.collected_coins += value


func get_input() -> void:
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
	
#	if not current_weapon.is_busy:
	if Input.is_action_pressed("ui_first_weapon"):
		_switch_weapons(FIRST)
	elif Input.is_action_pressed("ui_second_weapon"):
		_switch_weapons(SECOND)
	elif Input.is_action_pressed("ui_third_weapon"):
		_switch_weapons(THIRD)
	current_weapon._get_input()


func _switch_weapons(weapon_position: int) -> void:
	current_weapon.hide()
	current_weapon = weapons.get_child(weapon_position)
	current_weapon.show()


func is_hit_by_enemy() -> void:
	pass

