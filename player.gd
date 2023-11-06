extends Area2D
signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size
var fist: Node2D
var fist_animation_player: AnimationPlayer
var _smoothed_mouse_pos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	fist = get_node("Fist")
	fist_animation_player = fist.get_node("FistAnimationPlayer")
	hide()
	start(get_viewport_rect().size / 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	$AnimatedSprite2D.animation = "walk"
	_smoothed_mouse_pos = lerp(_smoothed_mouse_pos, get_global_mouse_position(), 0.3)	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("ui_attack") and not fist_animation_player.is_playing():
		fist_animation_player.play("attack")


func _on_body_entered(_body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
