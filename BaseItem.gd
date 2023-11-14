extends Area2D

@onready var animation = $AnimatedSprite2D

func _on_body_entered(body):
	if body.name == "Player":
		var tween = create_tween()
		animation.play("collected")
		tween.tween_property(self, "position", position + Vector2(0, -30), 0.5)
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		tween.tween_callback(queue_free)
