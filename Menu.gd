extends Control

@onready var press_sound = $PressButton
func _ready():
	pass


func _on_play_button_pressed() -> void:	
	press_sound.play()
	Switcher._level_handler("level_menu")


func _on_quit_button_pressed() -> void:
	press_sound.play()
	get_tree().quit()

