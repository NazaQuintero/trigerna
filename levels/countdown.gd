extends CanvasLayer

@onready var time = get_parent().get_node("TimerLevel")

func _process(delta):
	var time_left  = time.time_left
	var minutes = str(floor(time_left/60))
	var seconds = str(int(time_left)%60)
	$Label.text = minutes + ":" + seconds
