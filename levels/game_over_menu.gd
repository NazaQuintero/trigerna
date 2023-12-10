extends "res://Menu.gd"


func _ready():
	primary_button_text = "Restart"
	secondary_button_text = "Quit"
	primary_button.text = primary_button_text
	secondary_button.text = secondary_button_text

func _on_play_button_pressed() -> void:	
	press_sound.play()
#	Switcher._level_handler("level_menu")
	Switcher.reset_levels()


func _on_quit_button_pressed() -> void:
	press_sound.play()
	get_tree().quit()
