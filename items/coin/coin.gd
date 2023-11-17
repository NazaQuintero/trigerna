@icon("res://art/props_itens/bag_coins.png")
extends BaseItem
class_name Coin


func _ready():
	value = 5

func _on_body_entered(body):
	if body.name == "Player":
		var tween = create_tween()
		collected_sound.play()
		animation.play("collected")
		body.increment_coins(value)
		tween.tween_property(self, "position", position + Vector2(0, -30), 0.5)
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		tween.tween_callback(queue_free)
