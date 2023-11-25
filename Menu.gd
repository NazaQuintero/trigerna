extends Control

@export var primary_button_text = ""
@export var secondary_button_text = ""

@onready var primary_button = $VBoxContainer/PlayButton
@onready var secondary_button = $VBoxContainer/QuitButton
@onready var press_sound = $PressButton

func _ready():
	pass

func _on_play_button_pressed() -> void:	
	pass

func _on_quit_button_pressed() -> void:
	pass

