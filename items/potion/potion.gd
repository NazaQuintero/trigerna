extends BaseItem
class_name Potion

func _ready():
	value = 50

func _on_body_entered(body):
	if body.name == "Player":
		var tween = create_tween()
		collected_sound.play()
		animation.play("collected")
		body.increase_hitpoints(value)
		tween.tween_property(self, "position", position + Vector2(0, -30), 0.5)
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		tween.tween_callback(queue_free)
