extends Character

enum {UP, DOWN}

const MAX_HITPOINTS = 100

@onready var screen_size: Vector2 = get_viewport_rect().size
@onready var weapons: Node2D = $Weapons
@onready var current_weapon: Node2D = weapons.get_child(0)
@onready var healthbar: ProgressBar = $ProgressBar
@onready var collectedCoins = get_parent().get_node("CoinsCounterUi").get_child(0)


var damage_modifier: int = 2


func _ready() -> void:
	position = screen_size / 2
	update_health()


func _process(_delta: float) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if mouse_direction.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mouse_direction.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
	
	current_weapon.move(mouse_direction)
	update_health()
	collectedCoins.text = "Coins: " + str(CoinsCounter.coins)


func update_health():
	healthbar.value = self.hitpoints


func increase_hitpoints(value: int):
	var new_hitpoints = self.hitpoints + value
	if new_hitpoints >= MAX_HITPOINTS:
		self.hitpoints = MAX_HITPOINTS
	else: 
		self.hitpoints = new_hitpoints
	update_health()


func increment_coins(value: int):
	CoinsCounter.coins += value


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
	
	if not current_weapon.is_busy:
		if Input.is_action_just_released("ui_previous_weapon"):
			_switch_weapons(UP)
		elif Input.is_action_just_released("ui_next_weapon"):
			_switch_weapons(DOWN)
	current_weapon._get_input()


func _switch_weapons(direction: int) -> void:
	var index: int = current_weapon.get_index()
	if direction == UP:
		index -= 1
		if index < 0:
			index = weapons.get_child_count() - 1
	else:
		index += 1
		if index > weapons.get_child_count() - 1:
			index = 0
	
	current_weapon.hide()
	current_weapon = weapons.get_child(index)
	current_weapon.show()


func is_hit_by_enemy() -> void:
	pass

