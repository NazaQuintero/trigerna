extends CanvasLayer


func _ready():
	get_node("CoinsUI").get_child(0).text = "Coins: " + str(Global.collected_coins)

func _on_continue_pressed():
	pass # Replace with function body.
