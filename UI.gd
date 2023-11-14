extends CanvasLayer

const MIN_HEALTH: int = 23

var max_hitpoints: int = 4

@onready var parent: Node2D = get_parent()
@onready var player: CharacterBody2D = parent.get_node("Player")
@onready var health_bar: TextureProgressBar = get_node("HealthBar")
@onready var health_bar_tween: Tween = get_tree().create_tween().bind_node(health_bar)

func _ready() -> void:
	max_hitpoints = player.hitpoints
	_update_health_bar(100)
	
func _update_health_bar(new_value: int) -> void:
	print_debug("_update_health_bar: ", new_value)
	health_bar_tween.tween_property(health_bar, "value", new_value, 0.5)
	
func _on_player_hitpoints_changed(new_hitpoints: int) -> void:
	var new_health: int = int((100 - MIN_HEALTH) * float(new_hitpoints) / max_hitpoints) + MIN_HEALTH
	print_debug('new_healt: ', new_health)
	_update_health_bar(new_health)
