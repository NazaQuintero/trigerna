extends Character


@onready var screen_size: Vector2 = get_viewport_rect().size
@onready var fist: Node2D = get_node("Fist")
@onready var fist_hitbox: Area2D = get_node("Fist/Node2D/Sprite2D/Hitbox")
@onready var fist_animation_player: AnimationPlayer = fist.get_node("FistAnimationPlayer")


func _ready() -> void:
	position = screen_size / 2


func _process(_delta: float) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if mouse_direction.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mouse_direction.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
	fist.rotation = mouse_direction.angle()
	fist_hitbox.knockback_direction = mouse_direction
	if fist.scale.y == 1 and mouse_direction.x < 0:
		fist.scale.y = -1
	if fist.scale.y == -1 and mouse_direction.x > 0:
		fist.scale.y = 1
	if Input.is_action_just_pressed("ui_attack") and not fist_animation_player.is_playing():
		fist_animation_player.play("attack")


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
