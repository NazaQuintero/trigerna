extends "res://Menu.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	primary_button_text = "Play"
	secondary_button_text = "Quit"
	primary_button.text = primary_button_text
	secondary_button.text = secondary_button_text

func _on_play_button_pressed() -> void:	
	press_sound.play()
#	Switcher._level_handler("level_menu")
	Switcher.change_next_level()


func _on_quit_button_pressed() -> void:
	press_sound.play()
	get_tree().quit()
